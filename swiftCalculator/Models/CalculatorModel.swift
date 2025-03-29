import Foundation

struct CalculatorModel {
    var currentValue: Double = 0
    
    var storedValue: Double = 0
    
    var currentOperation: Operation = .none
    
    var lastOperationWasPerformed = false
    
    init() {
        reset()
    }
    
    mutating func reset() {
        currentValue = 0
        storedValue = 0
        currentOperation = .none
        lastOperationWasPerformed = false
    }
}
