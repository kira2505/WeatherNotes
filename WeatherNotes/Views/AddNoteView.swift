import SwiftUI

struct AddNoteView: View {
    @StateObject private var viewModel = AddNoteViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter note", text: $viewModel.text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Add Note") {
                viewModel.addNote()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Add note")
    }
}

