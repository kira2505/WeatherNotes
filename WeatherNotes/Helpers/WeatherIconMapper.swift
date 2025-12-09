import Foundation

struct WeatherIconMapper {
    static func map(_ icon: String) -> String {
        switch icon {
        case "01d": return "sun.max"
        case "01n": return "moon"
        case "02d": return "cloud.sun"
        case "02n": return "cloud.moon"
        case "03d", "03n": return "cloud"
        case "04d", "04n": return "cloud.fill"
        case "09d", "09n": return "cloud.drizzle"
        case "10d": return "cloud.sun.rain"
        case "10n": return "cloud.moon.rain"
        case "11d", "11n": return "cloud.bolt"
        case "13d", "13n": return "snow"
        case "50d", "50n": return "cloud.fog"
        default: return "questionmark"
        }
    }
}

