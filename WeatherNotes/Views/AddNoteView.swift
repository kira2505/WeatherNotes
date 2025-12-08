import SwiftUI

struct AddNoteView: View {
    @StateObject private var viewModel = AddNoteViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter note", text: $viewModel.text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add Note") {
                viewModel.addNote()
            }
            .buttonStyle(.borderedProminent)
            
            List(viewModel.notes) { note in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: note.weather.icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(note.text)
                            .bold()
                        
                        Text("Weather: \(note.weather.description), \(note.weather.temperature)°C")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(note.date.formatted(.dateTime.hour().minute().day().month()))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 4)
            }
        }
    }
}

