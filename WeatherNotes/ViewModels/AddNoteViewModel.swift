import SwiftUI
import Combine

@MainActor
class AddNoteViewModel: ObservableObject {
    @Published var text: String = ""
    
    private let noteService = NoteService()
    
    func addNote() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        Task {
            do {
                try await noteService.createNote(text)
                text = ""
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
