import Foundation

enum WeatherServiceError: Error {
    case badURL
    case requestFailed
    case decodingFailed
}

struct Weather {
    let temperature: Double
    let description: String
    let icon: String
    let location: String
}
