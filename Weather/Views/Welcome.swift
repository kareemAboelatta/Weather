
import Foundation

import SwiftUI
import CoreLocationUI

struct Welcome: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack(spacing: 20, content: {
            Text("Welcome to the\nWeather App")
                .font(.title)
                .bold()
            Text("Please share your current location to get the weather in your area")
                .multilineTextAlignment(.center)
                .padding()
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .foregroundColor(.white)
        })
    }
}

// The preview structure here might be incomplete or incorrect due to the OCR limitations

#Preview {
    ContentView()
}
