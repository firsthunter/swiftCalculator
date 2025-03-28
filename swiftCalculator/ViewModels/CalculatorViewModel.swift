import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    private let calculatorModel = CalculatorModel()
    @Published var displayText = "0"
    
    // Input handling
    func appendDigit(_ digit: String) {
        calculatorModel.appendDigit(digit)
        updateDisplay()
    }
    
    func clear() {
        calculatorModel.clear()
        updateDisplay()
    }
    
    func setOperation(_ operation: Operation) {
        calculatorModel.setOperation(operation)
        updateDisplay()
    }
    
    func calculate() {
        calculatorModel.calculate()
        updateDisplay()
    }
    
    func toggleSign() {
        if displayText.hasPrefix("-") {
            displayText.removeFirst()
        } else if displayText != "0" {
            displayText = "-" + displayText
        }
        
        if let value = Double(displayText) {
            calculatorModel.clear()
            calculatorModel.appendDigit(String(value))
        }
        updateDisplay()
    }
    
    func percentage() {
        if let value = Double(displayText) {
            let percentValue = value / 100
            displayText = formatNumber(percentValue)
            calculatorModel.clear()
            calculatorModel.appendDigit(displayText)
        }
        updateDisplay()
    }
    
    func inputPi() {
        let piValue = Double.pi
        displayText = formatNumber(piValue)
        calculatorModel.clear()
        calculatorModel.appendDigit(displayText)
        updateDisplay()
    }
    
    private func updateDisplay() {
        displayText = calculatorModel.getDisplayText()
    }
    
    private func formatNumber(_ number: Double) -> String {
        if number == Double(Int(number)) {
            return String(Int(number))
        }
        return String(number)
    }
}
