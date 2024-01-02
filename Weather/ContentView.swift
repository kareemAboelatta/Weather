import SwiftUI
import CoreLocationUI




struct ContentView: View {
    var body: some View {
        Home()
//        FakeDesign()
    }
}

#Preview {
    ContentView()
}




struct FakeDesign : View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CurrentWeatherSection()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(hourlyForecastData) { data in
                            HourlyWeatherView(data: data)
                        }
                    }
                }

                ForEach(dailyForecastData) { data in
                    DailyWeatherView(data: data)
                }

                WeatherDetailsSection()
            }
            .padding()
        }
        .background(Color.blue.opacity(0.1)) // Change as per theme
    }
}




struct CurrentWeatherSection: View {
    var body: some View {
        VStack {
            Text("San Francisco")
                .font(.title)
                .fontWeight(.medium)
            Text("76°")
                .font(.system(size: 70))
                .fontWeight(.bold)
            Text("Sunny")
                .font(.title3)
        }
    }
}



struct HourlyWeatherView: View {
    var data: WeatherData
    
    var body: some View {
        VStack {
            Image(systemName: data.icon)
                .font(.title)
            Text("\(data.temperature)°")
                .font(.headline)
            Text(data.time)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}


struct DailyWeatherView: View {
    var data: WeatherData
    
    var body: some View {
        HStack {
            Text(data.time)
                .font(.headline)
            Spacer()
            Image(systemName: data.icon)
                .font(.title)
            Text("\(data.temperature)°")
                .font(.headline)
        }
        .padding()
        
    }
}





struct WeatherDetailsSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Details")
                .font(.headline)
                .padding(.bottom, 5)
            HStack {
                Text("Humidity: 60%")
                Spacer()
                Text("Wind: 5 mph")
            }
        }
    }
}










struct WeatherData: Identifiable {
    var id = UUID()
    var time: String
    var icon: String
    var temperature: Int
}


let hourlyForecastData = [
    WeatherData(time: "Now", icon: "sun.max.fill", temperature: 76),
    WeatherData(time: "1PM", icon: "cloud.sun.fill", temperature: 74),
    WeatherData(time: "2PM", icon: "cloud.fill", temperature: 73),
    WeatherData(time: "Now", icon: "sun.max.fill", temperature: 76),
    WeatherData(time: "1PM", icon: "cloud.sun.fill", temperature: 74),
    WeatherData(time: "2PM", icon: "cloud.fill", temperature: 73),
    WeatherData(time: "Now", icon: "sun.max.fill", temperature: 76),
    WeatherData(time: "1PM", icon: "cloud.sun.fill", temperature: 74),
    WeatherData(time: "2PM", icon: "cloud.fill", temperature: 73),
    WeatherData(time: "Now", icon: "sun.max.fill", temperature: 76),
    WeatherData(time: "1PM", icon: "cloud.sun.fill", temperature: 74),
    WeatherData(time: "2PM", icon: "cloud.fill", temperature: 73),
    WeatherData(time: "Now", icon: "sun.max.fill", temperature: 76),
    WeatherData(time: "1PM", icon: "cloud.sun.fill", temperature: 74),
    WeatherData(time: "2PM", icon: "cloud.fill", temperature: 73),

]

let dailyForecastData = [
    WeatherData(time: "Monday", icon: "sun.max.fill", temperature: 70),
    WeatherData(time: "Tuesday", icon: "cloud.sun.fill", temperature: 68),
    WeatherData(time: "Wednesday", icon: "cloud.bolt.rain.fill", temperature: 65),
    WeatherData(time: "Thursday", icon: "snow", temperature: 30),
]

