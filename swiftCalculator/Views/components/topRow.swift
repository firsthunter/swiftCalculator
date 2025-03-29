
import SwiftUI

struct TopRow: View {
    let calculator: CalculatorViewModel
    let buttonSize: CGFloat
    
    var body: some View {
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
    }
}

