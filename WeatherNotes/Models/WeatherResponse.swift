import Foundation

struct WeatherResponse: Decodable {
    let main: Main
    let weather: [WeatherInfo]
    let name: String
}

struct Main: Decodable {
    let temp: Double
}

struct WeatherInfo: Decodable {
    let description: String
    let icon: String
}
