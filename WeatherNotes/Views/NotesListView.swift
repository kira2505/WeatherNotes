import SwiftUI

struct NotesListView: View {
    @StateObject var viewModel = NotesListViewModel()
    
    @AppStorage("appTheme") private var appTheme: AppTheme = .system

    private var themeIcon: String {
        switch appTheme {
        case .system: return "circle.lefthalf.filled"
        case .light:  return "sun.max.fill"
        case .dark:   return "moon.fill"
        }
    }
    
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddNoteView(viewModel: viewModel.viewModelAddNote)
                        .onDisappear {
                            viewModel.loadNotes()
                        }) {
                        Text("Add new note")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: toggleTheme) {
                        Image(systemName: themeIcon)
                    }
                }
            }
            .onAppear {
                viewModel.loadNotes()
            }
        }
    }
    
    private func toggleTheme() {
        switch appTheme {
        case .system:
            appTheme = .light
        case .light:
            appTheme = .dark
        case .dark:
            appTheme = .system
        }
    }
}
