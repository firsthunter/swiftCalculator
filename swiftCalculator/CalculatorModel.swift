import Foundation

class CalculatorModel {
    private let calculatorCore = CalculatorCore()
    private var currentValue: Double = 0
    private var storedValue: Double = 0
    private var currentOperation: Operation = .none
    private var isPerformingOperation = false
    private var displayText = "0"
    
    func getDisplayText() -> String {
        return displayText
    }
    
    func clear() {
        currentValue = 0
        storedValue = 0
        currentOperation = .none
        isPerformingOperation = false
        displayText = "0"
    }
    
    func appendDigit(_ digit: String) {
        if isPerformingOperation {
            displayText = digit
            isPerformingOperation = false
        } else if displayText == "0" && digit != "." {
            displayText = digit
        } else if digit == "." && displayText.contains(".") {
            // Prevent multiple decimal points
            return
        } else {
            displayText += digit
        }
        
        if let value = Double(displayText) {
            currentValue = value
        }
    }
    
    func setOperation(_ operation: Operation) {
        // Store the current result before setting a new operation
        calculate()
        
        currentOperation = operation
        storedValue = currentValue
        isPerformingOperation = true
    }
    
    func calculate() {
        guard currentOperation != .none else { return }
        
        // Special case for trig functions which only need one value
        if case .sine = currentOperation {
            currentValue = calculatorCore.sine(currentValue)
            displayText = formatResult(currentValue)
            currentOperation = .none
            return
        } else if case .cosine = currentOperation {
            currentValue = calculatorCore.cosine(currentValue)
            displayText = formatResult(currentValue)
            currentOperation = .none
            return
        } else if case .tangent = currentOperation {
            currentValue = calculatorCore.tangent(currentValue)
            displayText = formatResult(currentValue)
            currentOperation = .none
            return
        }
        
        // Basic operations
        var result: Double = 0
        switch currentOperation {
        case .addition:
            result = calculatorCore.add(currentValue, to: storedValue)
        case .subtraction:
            result = calculatorCore.subtract(currentValue, from: storedValue)
        case .multiplication:
            result = calculatorCore.multiply(currentValue, by: storedValue)
        case .division:
            result = calculatorCore.divide(storedValue, by: currentValue)
        default:
            return
        }
        
        currentValue = result
        displayText = formatResult(result)
        currentOperation = .none
    }
    
    private func formatResult(_ value: Double) -> String {
        // Remove trailing zeros for whole numbers
        if value == Double(Int(value)) {
            return String(Int(value))
        }
        
        return String(value)
    }
}
