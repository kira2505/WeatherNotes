import Foundation

struct WeatherResponse: Decodable {
    let main: Main
    let weather: [WeatherInfo]
}

struct Main: Decodable {
    let temp: Double
}

struct WeatherInfo: Decodable {
    let description: String
    let icon: String
}

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
        
        do {
            let decode = try JSONDecoder().decode(WeatherResponse.self, from: data)
            
            let weather = Weather(
                temperature: decode.main.temp,
                description: decode.weather.first?.description ?? "N/A",
                icon: decode.weather.first?.icon ?? "",
                location: city
            )
            
            return weather
        } catch {
         throw WeatherServiceError.decodingFailed
        }
    }
}
