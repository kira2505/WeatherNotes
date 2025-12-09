import Foundation

struct WeatherService {
    private let apiKey = "1e81fddada08f847f04696ba6f9cbd3a"
    private let city = "Kyiv"
    
    func getWeather() async throws -> Weather {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric") else {
            throw WeatherServiceError.badURL
        }
        
        let (data, responce) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = responce as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WeatherServiceError.requestFailed
        }
        
        let decode = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return Weather(
            temperature: decode.main.temp,
            description: decode.weather.first?.description ?? "N/A",
            icon: decode.weather.first?.icon ?? "",
            location: city
        )
    }
}
