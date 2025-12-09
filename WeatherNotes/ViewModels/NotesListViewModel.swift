import SwiftUI
import Combine

@MainActor
class NotesListViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    let viewModelAddNote = AddNoteViewModel()
    
    private let noteService =  NoteService()
    
    func loadNotes() {
        notes = noteService.loadNotes()
    }
    
    func addNote() {
        viewModelAddNote.addNote()
    }
}
