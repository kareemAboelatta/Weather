

import SwiftUI

struct WeatherView :View {
    
    var weather : ResponseBody
    
    var body : some View{
        VStack(alignment: .leading, spacing: 10){
            Text("\(weather.name)")
                .font(.system(size: 38,weight: .semibold ))
                .colorMultiply(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Text("\(Date().formatted(.dateTime.month().day()))")
                .font(.system(size: 20))
                .opacity(0.5)
            
            
        
            HStack{
                Image("rain")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)

                VStack{
                    Text("\(weather.main.feelsLike.roundDouble())")
                        .font(.system(size: 86,weight: .semibold))

                    Text("\(weather.weather[0].main)")
                        .font(.system(size: 26))

                }.padding(.leading)
                
                Spacer()
            }
            .padding()
            

            
            
            WeatherCardView(icon: "thermometer", text: "Min Temp", value: weather.main.tempMin.roundDouble() + "*")
            WeatherCardView(icon: "thermometer", text: "Max Temp", value: weather.main.tempMax.roundDouble() + "*")
            WeatherCardView(icon: "wind", text: "Wind Speed", value: weather.wind.speed.roundDouble() + "m/s")
            WeatherCardView(icon: "humidity", text: "humidity", value: weather.main.humidity.roundDouble() + "% ")
            
            
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity)
        .padding(10)
        .background(LinearGradient(colors: [Color("light"),Color("dark")], startPoint: .topLeading , endPoint: UnitPoint.bottomTrailing))
        
        
        
    }
    
}


struct WeatherCardView :View {
    var icon:String
    var text:String
    var value:String
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: icon)
                .imageScale(.large)
                .frame(width: 50, height: 50)
                .background(.white.opacity(0.7))
                .cornerRadius(15)
            
            
            Text(text)
                .font(.system(size: 15))
            
            Spacer()
        
            Text("\(value)")
                .font(.headline)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(.white.opacity(0.3))
        .cornerRadius(12)
    }
}









#Preview {
    WeatherView(weather: previewWeather)
}





extension Double{
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
