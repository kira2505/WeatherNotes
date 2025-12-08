import Foundation

class NoteService {
    
    func createNote(_ text: String) {
        Task {
            do {
                let weather = try await WeatherService().getWeather(for: "Kyiv")
                
                let note = Note(
                    id: UUID(),
                    text: text,
                    date: Date(),
                    weather: weather
                )
                
                var notes = loadNotes()
                notes.append(note)
                saveNotes(notes)
            } catch {
                print(error)
            }
        }
    }
    
    private func saveNotes(_ notes: [Note]) {
        if let data = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(data, forKey: "notes")
        }
    }
    
    func loadNotes() -> [Note] {
        guard let data = UserDefaults.standard.data(forKey: "notes"),
              let notes = try? JSONDecoder().decode([Note].self, from: data) else {
            return []
        }
        return notes
    }
}
