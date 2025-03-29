import SwiftUI

struct PortraitButtonGrid: View {
    let calculator: CalculatorViewModel
    let geometry: GeometryProxy
    
    private var buttonSize: CGFloat {
        min(
            (geometry.size.width - 5 * 12) / 4,  // 4 buttons horizontally with 12pt spacing
            (geometry.size.height * 0.6 - 6 * 12) / 7  // 7 rows with 12pt spacing
        )
    }
    
    var body: some View {
        VStack(spacing: 12) {
            // Row 1
            HStack(spacing: 12) {
                CalculatorButton(title: "C", backgroundColor: .gray, foregroundColor: .black, width: buttonSize, height: buttonSize) {
                    calculator.clear()
                }
                
                CalculatorButton(title: "+/-", backgroundColor: .gray, foregroundColor: .black, width: buttonSize, height: buttonSize) {
                    calculator.toggleSign()
                }
                
                CalculatorButton(title: "%", backgroundColor: .gray, foregroundColor: .black, width: buttonSize, height: buttonSize) {
                    calculator.percentage()
                }
                
                CalculatorButton(title: "÷", backgroundColor: .orange, width: buttonSize, height: buttonSize) {
                    calculator.setOperation(.division)
                }
            }
            
            // Number rows (7-8-9, 4-5-6, 1-2-3)
            NumberRows(calculator: calculator, buttonSize: buttonSize)
            
            // Row 5 - Zero, decimal, equals
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
            
            // Row 6 - Trigonometric functions
            TrigFunctionsRow(calculator: calculator, buttonSize: buttonSize)
        }
    }
}
