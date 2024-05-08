//
//  weatherButton.swift
//  SwiftUI-WeatherApp
//
//  Created by Sagar Jangra on 08/05/2024.
//

import SwiftUI

struct weatherButton : View{
    
    let title : String
    var textColor : Color
    var backgroundColor : Color
    
    var body : some View{
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor.gradient)
                .foregroundStyle(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

