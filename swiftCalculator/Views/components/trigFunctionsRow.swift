//
//  trigFunctionsRow.swift
//  swiftCalculator
//
//  Created by Mac Mini 6 on 29/3/2025.
//

import SwiftUI

struct TrigFunctionsRow: View {
    let calculator: CalculatorViewModel
    let buttonSize: CGFloat
    
    var body: some View {
        HStack(spacing: 12) {
            CalculatorButton(title: "sin", backgroundColor: .blue, width: buttonSize, height: buttonSize) {
                calculator.setOperation(.sine)
                calculator.calculate()
            }
            
            CalculatorButton(title: "cos", backgroundColor: .blue, width: buttonSize, height: buttonSize) {
                calculator.setOperation(.cosine)
                calculator.calculate()
            }
            
            CalculatorButton(title: "tan", backgroundColor: .blue, width: buttonSize, height: buttonSize) {
                calculator.setOperation(.tangent)
                calculator.calculate()
            }
            
            CalculatorButton(title: "π", backgroundColor: .blue, width: buttonSize, height: buttonSize) {
                calculator.inputPi()
            }
        }
    }
}

