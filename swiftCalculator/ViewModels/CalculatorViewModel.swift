import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    private let calculatorCore = CalculatorCore()
    private var model = CalculatorModel()
    
    @Published var displayText: String = "0"
    private var isEnteringNumber = true
    
    init() {
        updateDisplayText()
    }
    
    private func updateDisplayText() {
        displayText = formatValue(model.currentValue)
    }
    
    private func formatValue(_ value: Double) -> String {
        // Remove trailing zeros for whole numbers
        if value == Double(Int(value)) {
            return String(Int(value))
        }
        return String(value)
    }
    
    func clear() {
        model.reset()
        displayText = "0"
        isEnteringNumber = true
    }
    
    func appendDigit(_ digit: String) {
        if !isEnteringNumber {
            displayText = digit
            isEnteringNumber = true
        }
        else if displayText == "0" && digit != "." {
            displayText = digit
        }
        else if digit == "." && displayText.contains(".") {
            return
        }
        else {
            displayText += digit
        }
        
        if let value = Double(displayText) {
            model.currentValue = value
        }
    }
    
    func setOperation(_ operation: Operation) {
        if let value = Double(displayText) {
            model.currentValue = value
        }
        
        if model.currentOperation != .none {
            performCalculation()
        }
        
        model.currentOperation = operation
        model.storedValue = model.currentValue
        model.lastOperationWasPerformed = true
        
        if isUnaryOperation(operation) {
            calculate()
        } else {
            isEnteringNumber = false
        }
    }
    
    func calculate() {
        if let value = Double(displayText) {
            model.currentValue = value
        }
        
        performCalculation()
        
        displayText = formatValue(model.currentValue)
        isEnteringNumber = false
    }
    
    private func performCalculation() {
        guard model.currentOperation != .none else { return }
        
        switch model.currentOperation {
        case .sine:
            model.currentValue = calculatorCore.sine(model.currentValue)
        case .cosine:
            model.currentValue = calculatorCore.cosine(model.currentValue)
        case .tangent:
            model.currentValue = calculatorCore.tangent(model.currentValue)
        case .addition:
            model.currentValue = calculatorCore.add(model.currentValue, to: model.storedValue)
        case .subtraction:
            model.currentValue = calculatorCore.subtract(model.currentValue, from: model.storedValue)
        case .multiplication:
            model.currentValue = calculatorCore.multiply(model.currentValue, by: model.storedValue)
        case .division:
            model.currentValue = calculatorCore.divide(model.storedValue, by: model.currentValue)
        case .none:
            break
        }
        
        model.currentOperation = .none
        model.lastOperationWasPerformed = true
    }
    
    private func isUnaryOperation(_ operation: Operation) -> Bool {
        return operation == .sine || operation == .cosine || operation == .tangent
    }
    
    func toggleSign() {
        if let value = Double(displayText) {
            let negatedValue = -value
            displayText = formatValue(negatedValue)
            model.currentValue = negatedValue
        }
    }
    
    func percentage() {
        if let value = Double(displayText) {
            let percentValue = value / 100.0
            displayText = formatValue(percentValue)
            model.currentValue = percentValue
        }
    }
    
    func inputPi() {
        let pi = Double.pi
        displayText = formatValue(pi)
        model.currentValue = pi
        isEnteringNumber = false
    }
}
