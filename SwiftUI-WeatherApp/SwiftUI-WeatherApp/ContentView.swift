//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Sagar Jangra on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight) //for binding we use $ symbol

            VStack{
                cityTextView(cityName: "Chakkarpur, Gurugram")
                
                currentWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 40)
                
                
                HStack(spacing:20){
                    weatherDayView(dayOfWeek: "TUE",
                                      imageName: "sun.max.fill",
                                      temp: 38)
                    
                    weatherDayView(dayOfWeek: "WED",
                                      imageName: "sun.rain.fill",
                                      temp: 31)
                    
                    weatherDayView(dayOfWeek: "THU",
                                      imageName: "cloud.rain.fill",
                                      temp: 27)
                    
                    weatherDayView(dayOfWeek: "FRI",
                                      imageName: "wind.snow",
                                      temp: 28)
                    
                    weatherDayView(dayOfWeek: "SAT",
                                      imageName: "cloud.sun.rain.fill",
                                      temp: 30)
                }
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                }, label: {
                    weatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                })
                
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct weatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temp : Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(Color(.white))
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°C")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(Color(.white))
        }
    }
    
}

struct BackgroundView: View {
    
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct cityTextView : View {
    var cityName : String
    var body : some View{
        Text(cityName)
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundStyle(Color(.white))
            .padding()
    }
}

struct currentWeatherView: View {
    
    let imageName : String
    let temp : Int
    
    var body: some View {
        VStack(spacing:5){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(temp)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(Color(.white))
            
        }
        .padding(.bottom,40)
    }
}


