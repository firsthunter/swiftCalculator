//
//  leftSection.swift
//  swiftCalculator
//
//  Created by Mac Mini 6 on 29/3/2025.
//

import SwiftUI

struct LeftSection: View {
    let calculator: CalculatorViewModel
    let buttonSize: CGFloat
    
    var body: some View {
        VStack(spacing: 12) {
            TopRow(calculator: calculator, buttonSize: buttonSize)
            NumberRows(calculator: calculator, buttonSize: buttonSize)
            HStack(spacing: 12) {
                CalculatorButton(title: "0", backgroundColor: Color(.darkGray), width: buttonSize * 2 + 12, height: buttonSize) {
                    calculator.appendDigit("0")
                }
                
                CalculatorButton(title: ".", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit(".")
                }
                
                CalculatorButton(title: "=", backgroundColor: .orange, width: buttonSize, height: buttonSize) {
                    calculator.calculate()
                }
            }
        }
    }
}

