import SwiftUI

struct RightSection: View {
    let calculator: CalculatorViewModel
    let buttonSize: CGFloat
    
    var body: some View {
        VStack(spacing: 12) {
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
            }
            
            HStack(spacing: 12) {
                CalculatorButton(title: "π", backgroundColor: .blue, width: buttonSize, height: buttonSize) {
                    calculator.inputPi()
                }
                
                // Space for additional scientific buttons
                CalculatorButton(title: "^", backgroundColor: .blue, width: buttonSize, height: buttonSize) {
                    // Add power functionality
                }
                
                CalculatorButton(title: "√", backgroundColor: .blue, width: buttonSize, height: buttonSize) {
                    // Add square root functionality
                }
            }
        }
    }
}

