import Foundation

class CalculatorCore {
    
    func add(_ value: Double, to: Double) -> Double {
        return to + value
    }
    
    func subtract(_ value: Double, from: Double) -> Double {
        return from - value
    }
    
    func multiply(_ value: Double, by: Double) -> Double {
        return value * by
    }
    
    func divide(_ value: Double, by: Double) -> Double {
        guard by != 0 else { return Double.infinity }
        return value / by
    }
    
    func sine(_ value: Double) -> Double {
        let radians = value * .pi / 180 
        return sin(radians)
    }
    
    func cosine(_ value: Double) -> Double {
        return cos(value)
    }
    
    func tangent(_ value: Double) -> Double {
        let radians = value * .pi / 180
        return tan(radians)
    }
}
