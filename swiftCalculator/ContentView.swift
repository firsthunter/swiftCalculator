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
    
    var body: some View {
        GeometryReader { geometry in
            if horizontalSizeClass == .compact { // Portrait mode
                VStack(spacing: 12) {
                    displayView
                    buttonsGridPortrait
                }
                .padding()
            } else { // Landscape mode
                HStack {
                    VStack {
                        displayView
                        buttonsGridLandscape
                    }
                    .padding()
                }
            }
        }
    }
    
    private var displayView: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text(calculator.displayText)
                .font(.system(size: 64))
                .fontWeight(.light)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
    
    private var buttonsGridPortrait: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                CalculatorButton(title: "C", backgroundColor: .gray, foregroundColor: .black) {
                    calculator.clear()
                }
                
                CalculatorButton(title: "+/-", backgroundColor: .gray, foregroundColor: .black) {
                    calculator.toggleSign()
                }
                
                CalculatorButton(title: "%", backgroundColor: .gray, foregroundColor: .black) {
                    calculator.percentage()
                }
                
                CalculatorButton(title: "÷", backgroundColor: .orange) {
                    calculator.setOperation(.division)
                }
            }
            
            HStack(spacing: 12) {
                CalculatorButton(title: "7", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("7")
                }
                
                CalculatorButton(title: "8", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("8")
                }
                
                CalculatorButton(title: "9", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("9")
                }
                
                CalculatorButton(title: "×", backgroundColor: .orange) {
                    calculator.setOperation(.multiplication)
                }
            }
            
            HStack(spacing: 12) {
                CalculatorButton(title: "4", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("4")
                }
                
                CalculatorButton(title: "5", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("5")
                }
                
                CalculatorButton(title: "6", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("6")
                }
                
                CalculatorButton(title: "-", backgroundColor: .orange) {
                    calculator.setOperation(.subtraction)
                }
            }
            
            HStack(spacing: 12) {
                CalculatorButton(title: "1", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("1")
                }
                
                CalculatorButton(title: "2", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("2")
                }
                
                CalculatorButton(title: "3", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit("3")
                }
                
                CalculatorButton(title: "+", backgroundColor: .orange) {
                    calculator.setOperation(.addition)
                }
            }
            
            HStack(spacing: 12) {
                CalculatorButton(title: "0", backgroundColor: Color(.darkGray), width: 152) {
                    calculator.appendDigit("0")
                }
                
                CalculatorButton(title: ".", backgroundColor: Color(.darkGray)) {
                    calculator.appendDigit(".")
                }
                
                CalculatorButton(title: "=", backgroundColor: .orange) {
                    calculator.calculate()
                }
            }
            
            // Trigonometric functions row
            HStack(spacing: 12) {
                CalculatorButton(title: "sin", backgroundColor: .blue) {
                    calculator.setOperation(.sine)
                    calculator.calculate()
                }
                
                CalculatorButton(title: "cos", backgroundColor: .blue) {
                    calculator.setOperation(.cosine)
                    calculator.calculate()
                }
                
                CalculatorButton(title: "tan", backgroundColor: .blue) {
                    calculator.setOperation(.tangent)
                    calculator.calculate()
                }
                
                CalculatorButton(title: "π", backgroundColor: .blue) {
                    calculator.inputPi()
                }
            }
        }
    }
    
    private var buttonsGridLandscape: some View {
        HStack(alignment: .top, spacing: 16) {
            // Left side - basic operations
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    CalculatorButton(title: "C", backgroundColor: .gray, foregroundColor: .black) {
                        calculator.clear()
                    }
                    
                    CalculatorButton(title: "+/-", backgroundColor: .gray, foregroundColor: .black) {
                        calculator.toggleSign()
                    }
                    
                    CalculatorButton(title: "%", backgroundColor: .gray, foregroundColor: .black) {
                        calculator.percentage()
                    }
                }
                
                HStack(spacing: 12) {
                    CalculatorButton(title: "7", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("7")
                    }
                    
                    CalculatorButton(title: "8", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("8")
                    }
                    
                    CalculatorButton(title: "9", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("9")
                    }
                }
                
                HStack(spacing: 12) {
                    CalculatorButton(title: "4", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("4")
                    }
                    
                    CalculatorButton(title: "5", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("5")
                    }
                    
                    CalculatorButton(title: "6", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("6")
                    }
                }
                
                HStack(spacing: 12) {
                    CalculatorButton(title: "1", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("1")
                    }
                    
                    CalculatorButton(title: "2", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("2")
                    }
                    
                    CalculatorButton(title: "3", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit("3")
                    }
                }
                
                HStack(spacing: 12) {
                    CalculatorButton(title: "0", backgroundColor: Color(.darkGray), width: 152) {
                        calculator.appendDigit("0")
                    }
                    
                    CalculatorButton(title: ".", backgroundColor: Color(.darkGray)) {
                        calculator.appendDigit(".")
                    }
                }
            }
            
            // Right side - operators and trig functions
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    CalculatorButton(title: "÷", backgroundColor: .orange) {
                        calculator.setOperation(.division)
                    }
                    
                    CalculatorButton(title: "π", backgroundColor: .blue) {
                        calculator.inputPi()
                    }
                }
                
                HStack(spacing: 12) {
                    CalculatorButton(title: "×", backgroundColor: .orange) {
                        calculator.setOperation(.multiplication)
                    }
                    
                    CalculatorButton(title: "sin", backgroundColor: .blue) {
                        calculator.setOperation(.sine)
                        calculator.calculate()
                    }
                }
                
                HStack(spacing: 12) {
                    CalculatorButton(title: "-", backgroundColor: .orange) {
                        calculator.setOperation(.subtraction)
                    }
                    
                    CalculatorButton(title: "cos", backgroundColor: .blue) {
                        calculator.setOperation(.cosine)
                        calculator.calculate()
                    }
                }
                
                HStack(spacing: 12) {
                    CalculatorButton(title: "+", backgroundColor: .orange) {
                        calculator.setOperation(.addition)
                    }
                    
                    CalculatorButton(title: "tan", backgroundColor: .blue) {
                        calculator.setOperation(.tangent)
                        calculator.calculate()
                    }
                }
                
                CalculatorButton(title: "=", backgroundColor: .orange, width: 152) {
                    calculator.calculate()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
