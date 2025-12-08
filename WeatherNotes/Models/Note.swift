import Foundation

struct Note: Codable {
    let id: UUID
    let text: String
    let date: Date
    let weather: Weather
}
