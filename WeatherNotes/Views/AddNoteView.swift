import SwiftUI

struct AddNoteView: View {
    @ObservedObject var viewModel: AddNoteViewModel
    
    @Environment(\.dismiss) private var dismiss
        
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter note", text: $viewModel.text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Add Note") {
                viewModel.addNote()
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Add note")
    }
}
