import SwiftUI

@main
struct WeatherNotesApp: App {
    @AppStorage("appTheme") private var appTheme: AppTheme = .system
    var body: some Scene {
        WindowGroup {
            NotesListView()
                .preferredColorScheme(
                    appTheme == .system ? nil :
                        appTheme == .dark ? .dark : .light)
        }
    }
}
