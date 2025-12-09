import SwiftUI
import Combine

@MainActor
class NotesListViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    private let noteService =  NoteService()
    
    func loadNotes() {
        notes = noteService.loadNotes()
    }
}
