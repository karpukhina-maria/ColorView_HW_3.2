//
//  ContentView.swift
//  ColorView_HW_3.2
//
//  Created by Mary Jane on 28.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double(Int.random(in: 0...255))
    @State private var greenSliderValue = Double(Int.random(in: 0...255))
    @State private var blueSliderValue = Double(Int.random(in: 0...255))
    
    var body: some View {
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea()
            VStack {
                ColorView(redValue: redSliderValue, greenValue: greenSliderValue, blueValue: blueSliderValue)
                    .padding(.vertical)
                VStack {
                    ColorSliderKit(sliderValue: $redSliderValue, color: .red)
                    ColorSliderKit(sliderValue: $greenSliderValue, color: .green)
                    ColorSliderKit(sliderValue: $blueSliderValue, color: .blue)
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct ColorSliderKit: View {
    @Binding var sliderValue: Double    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))").fontWeight(.bold).foregroundColor(.white).frame(width: 40.0)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
                .padding(.horizontal)
            TextField("", value: $sliderValue, format: .number)
                .frame(width: 50.0).textFieldStyle(.roundedBorder)
        }
        .padding(.horizontal)
    }
}

struct ColorView: View {
    let redValue: Double
    let greenValue: Double
    let blueValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(height: 200.0)
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 3)
            )
            .foregroundColor(Color(red: redValue/255, green: greenValue/255, blue: blueValue/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

