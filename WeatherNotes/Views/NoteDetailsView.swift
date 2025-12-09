import SwiftUI

struct NoteDetailsView: View {
    @StateObject var viewModel: NoteDetailsViewModel
    
    init(note: Note) {
        _viewModel = StateObject(wrappedValue: NoteDetailsViewModel(note: note))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.note.text)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(viewModel.formattedDate)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Divider()
            
            Image(systemName: viewModel.weatherIconName())
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Text(viewModel.temperatureText)
                .font(.system(size: 50))
                .bold()
            
            Text(viewModel.weatherDescription)
                .font(.title2)
            
            Text(viewModel.locationText)
                .font(.headline)
                .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}
