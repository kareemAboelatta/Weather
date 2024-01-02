

import Foundation


import SwiftUI

struct Home: View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    
    @State var  weather : ResponseBody?

    var body: some View {
        VStack {
            if let location = locationManager.location {
//                Text("Longitude: \(location.longitude), Latitude: \(location.latitude)")
                
                if let  weather = weather{
                       WeatherView(weather: previewWeather)
                }else{
                    ProgressView().task {
                        do{
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        }catch{
                            print("Error: \(error)")
                        }
                    }
                }
                
                
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    Welcome()
                        .environmentObject(locationManager)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color("light"), Color("dark")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}


#Preview {
    Home()
}
