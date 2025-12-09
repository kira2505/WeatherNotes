import SwiftUI
import Combine

@MainActor
class NoteDetailsViewModel: ObservableObject {
    let note: Note
    
    init(note: Note) {
        self.note = note
    }
    
    var formattedDate: String {
        note.date.formatted(.dateTime.day().month().hour().minute())
    }
    
    var temperatureText: String {
        "\(Int(note.weather.temperature))°C"
    }
    
    var weatherDescription: String {
        note.weather.description.capitalized
    }
    
    var locationText: String {
        "Location: \(note.weather.location)"
    }
    
    func weatherIconName() -> String {
        WeatherIconMapper.map(note.weather.icon)
    }
}

