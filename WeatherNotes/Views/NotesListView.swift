import SwiftUI

struct NotesListView: View {
    @StateObject var viewModel = NotesListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.notes) {note in
                NavigationLink(destination: NoteDetailsView(note: note)) {
                    HStack(spacing: 12) {
                        Image(systemName: WeatherIconMapper.map(note.weather.icon))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        
                        VStack(alignment: .leading) {
                            Text(note.text).bold()
                            
                            Text(note.date.formatted(.dateTime.day().month().hour().minute()))
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text("\(Int(note.weather.temperature))°C")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Weather Notes")
            .onAppear {
                viewModel.loadNotes()
            }
        }
    }
}
