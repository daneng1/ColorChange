//
//  ContentView.swift
//  ColorChange
//
//  Created by Dan Engel on 8/19/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var hue1 = ColorChange(color: 1.0)
    @ObservedObject var hue2 = ColorChange(color: 0.5)
    @ObservedObject var hue3 = ColorChange(color: 0.0)
    private let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var color1: Color {
        Color(
            red: hue1.color,
            green: hue2.color,
            blue: hue3.color)
    }
    var color2: Color {
        Color(
            red: hue2.color,
            green: hue3.color,
            blue: hue1.color)
    }
    var color3: Color {
        Color(
            red: hue1.color,
            green: hue1.color,
            blue: hue3.color)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 200)
                    .cornerRadius(7)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Circle()
                    .foregroundColor(color1)
                    .frame(width: 180)
                    .blur(radius: 40)
                    .offset(x: -40, y: -30)
                Circle()
                    .foregroundColor(color2)
                    .frame(width: 160)
                    .blur(radius: 40)
                    .offset(x: 70, y: 0)
                Circle()
                    .foregroundColor(color3)
                    .frame(width: 130)
                    .blur(radius: 60)
                    .offset(x: -30, y: 70)
                Image("apple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .offset(x: -120, y: -70)
                Image("mastercard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .offset(x: 100, y: 60)
            }
            .frame(width: 300, height: 200)
            .cornerRadius(7)
            .foregroundColor(color1)
            .shadow(radius: 3)
            .onReceive(timer) { _ in
                hue1.updateColor(min: 0.8, max: 1.0)
                hue2.updateColor(min: 0.3, max: 0.7)
                hue3.updateColor(min: 0.0, max: 0.2)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
