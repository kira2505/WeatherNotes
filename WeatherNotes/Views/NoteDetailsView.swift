import SwiftUI

struct NoteDetailsView: View {
    let note: Note
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(note.text)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(note.date.formatted(.dateTime.day().month().hour().minute()))
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Divider()
            
            Image(systemName: mapIcon(note.weather.icon))
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.yellow)
            
            Text("\(Int(note.weather.temperature))°C")
                .font(.system(size: 50))
                .bold()
            
            Text(note.weather.description.capitalized)
                .font(.title2)
            
            Text("Location: \(note.weather.location)")
                .font(.headline)
                .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
    
    func mapIcon(_ code: String) -> String {
        switch code {
        case "01d": return "sun.max"
        case "01n": return "moon"
        case "02d": return "cloud.sun"
        case "02n": return "cloud.moon"
        case "03d", "03n": return "cloud"
        case "04d", "04n": return "smoke"
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
