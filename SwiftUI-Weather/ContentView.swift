//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Ahmed Hamam on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                Text("Cairo, Egypt")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original) //multicolor of sfsymbol
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180,height: 180)// to fit image and size it as i want
                    Text("38°C")
                        .font(.system(size: 70,weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 45)
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 34)
                   
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 40)
                    
                   WeatherDayView(dayOfWeek: "THU", imageName: "wind", temperature: 28)
                    
                  WeatherDayView(dayOfWeek: "THU", imageName: "sunset.fill", temperature: 25)
                    
                   WeatherDayView(dayOfWeek: "FRI", imageName: "moon.stars.fill", temperature: 22)
                }
                Spacer() // push text to top of vstack
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 270, height: 55)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
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
    
    var dayOfWeek : String
    var imageName: String
    var temperature: Int
   
    var body: some View {
        VStack(alignment: .leading) {
            Text(dayOfWeek)
                .font(.system(size: 26,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 33,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)//to fill safe area with color too
    }
}
