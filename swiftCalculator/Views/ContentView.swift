//
//  ContentView.swift
//  swiftCalculator
//
//  Created by Mac Mini 6 on 27/3/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var calculator = CalculatorViewModel()
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if horizontalSizeClass == .compact && verticalSizeClass == .regular { // Portrait mode
                portraitLayout(geometry: geometry)
            } else { // Landscape mode or iPad
                landscapeLayout(geometry: geometry)
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func portraitLayout(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            Spacer()
            
            DisplayView(displayText: calculator.displayText)
                .padding(.horizontal)
                .padding(.bottom, geometry.size.height * 0.02)
            
            // Buttons grid
            PortraitButtonGrid(calculator: calculator, geometry: geometry)
                .padding(.horizontal)
                .padding(.bottom, geometry.size.height * 0.02)
        }
    }
    
    private func landscapeLayout(geometry: GeometryProxy) -> some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Spacer()
                
                DisplayView(displayText: calculator.displayText)
                    .padding(.horizontal)
                    .padding(.bottom, geometry.size.height * 0.03)
                
                // Buttons grid
                LandscapeButtonGrid(calculator: calculator, geometry: geometry)
                    .padding(.horizontal)
                    .padding(.bottom, geometry.size.height * 0.03)
            }
            .frame(width: geometry.size.width)
        }
    }
}

#Preview {
    ContentView()
}
