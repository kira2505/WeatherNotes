import SwiftUI
import Combine

@MainActor
class AddNoteViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var notes: [Note] = []
    
    private let noteService = NoteService()
    
    init() {
        loadNotes()
    }
    
    func addNote() {
        Task {
            noteService.createNote(text)
            
            loadNotes()
            
            text = ""
        }
    }
    
    func loadNotes() {
        notes = noteService.loadNotes()
    }
}
