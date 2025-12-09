import Foundation

class NoteService {
    private let weatherService: WeatherService
    
    private let storegeKey = "notes"
    
    init(weatherService: WeatherService = WeatherService()) {
        self.weatherService = weatherService
    }
    
    func createNote(_ text: String) async throws{
        let weather = try await weatherService.getWeather()
        
        let note = Note(
            id: UUID(),
            text: text,
            date: Date(),
            weather: weather
        )
        
        var notes = loadNotes()
        notes.append(note)
        saveNotes(notes)
    }
    
    private func saveNotes(_ notes: [Note]) {
        guard let data = try? JSONEncoder().encode(notes) else { return }
        UserDefaults.standard.set(data, forKey: storegeKey)
    }
    
    func loadNotes() -> [Note] {
        guard let data = UserDefaults.standard.data(forKey: storegeKey),
              let notes = try? JSONDecoder().decode([Note].self, from: data)
        else { return [] }
        
        return notes.sorted { $0.date > $1.date }
    }
    
    func deleteNote(_ id: UUID) {
        var notes = loadNotes()
        notes.removeAll { $0.id == id }
        saveNotes(notes)
    }
}
