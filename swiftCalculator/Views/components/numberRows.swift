//
//  numberRows.swift
//  swiftCalculator
//
//  Created by Mac Mini 6 on 29/3/2025.
//

import SwiftUI

struct NumberRows: View {
    let calculator: CalculatorViewModel
    let buttonSize: CGFloat
    
    var body: some View {
        Group {
            // Row 2 - 7-8-9, multiply
            HStack(spacing: 12) {
                CalculatorButton(title: "7", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("7")
                }
                
                CalculatorButton(title: "8", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("8")
                }
                
                CalculatorButton(title: "9", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("9")
                }
                
                CalculatorButton(title: "×", backgroundColor: .orange, width: buttonSize, height: buttonSize) {
                    calculator.setOperation(.multiplication)
                }
            }
            
            HStack(spacing: 12) {
                CalculatorButton(title: "4", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("4")
                }
                
                CalculatorButton(title: "5", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("5")
                }
                
                CalculatorButton(title: "6", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("6")
                }
                
                CalculatorButton(title: "-", backgroundColor: .orange, width: buttonSize, height: buttonSize) {
                    calculator.setOperation(.subtraction)
                }
            }
            
            HStack(spacing: 12) {
                CalculatorButton(title: "1", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("1")
                }
                
                CalculatorButton(title: "2", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("2")
                }
                
                CalculatorButton(title: "3", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("3")
                }
                
                CalculatorButton(title: "+", backgroundColor: .orange, width: buttonSize, height: buttonSize) {
                    calculator.setOperation(.addition)
                }
            }
        }
    }
}

