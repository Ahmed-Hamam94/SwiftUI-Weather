//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ahmed Hamam on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
//    var weatherDayModel : WeatherDayModel
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
              CityTextview(cityName: "Cairo, Egypt")
                
              MainWeatherStatusView(imageName: isNight ? "moon.fill" : "cloud.sun.fill", temperature: 38)
                
                HStack(spacing: 20){
                    WeatherDayView(weatherDayModel: WeatherDayModel(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 34))
                   
                    WeatherDayView(weatherDayModel: WeatherDayModel(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 40))
                   
                    WeatherDayView(weatherDayModel: WeatherDayModel(dayOfWeek: "THU", imageName: "wind", temperature: 28))
                    
                   WeatherDayView(weatherDayModel: WeatherDayModel(dayOfWeek: "THU", imageName: "sunset.fill", temperature: 25))
                    
                  WeatherDayView(weatherDayModel: WeatherDayModel(dayOfWeek: "FRI", imageName: "moon.stars.fill", temperature: 22))
                    
                   
                }
                Spacer() // push text to top of vstack
                Button {
                   
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: Color.white, backgroundColor: Color.mint)
                }
                Spacer()

            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var weatherDayModel : WeatherDayModel
   
    var body: some View {
        VStack(alignment: .leading) {
            Text(weatherDayModel.dayOfWeek)
                .font(.system(size: 26,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weatherDayModel.imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
               // .foregroundStyle(.pink, .orange, .green)
                .aspectRatio( contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(weatherDayModel.temperature)°")
                .font(.system(size: 33,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
     var isNight: Bool
    
    var body: some View {
        // custom gradient
//        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .blue, isNight ? .gray :  Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()//to fill safe area with color too
        
        // defaulte gradient
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
        
    }
}

struct CityTextview: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original) //multicolor of sfsymbol
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)// to fit image and size it as i want
            Text("\(temperature)°C")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 45)
    }
}


