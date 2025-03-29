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
            numberRows
            
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
            trigFunctionsRow
        }
    }
    
    private var numberRows: some View {
        Group {
            // Row 2 - 7-8-9
            HStack(spacing: 12) {
                CalculatorButton(title: "7", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("7")
                }
                
                CalculatorButton(title: "8", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("8")
                }
                
                CalculatorButton(title: "9", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("9")
                }
                
                CalculatorButton(title: "×", backgroundColor: .orange, width: buttonSize, height: buttonSize) {
                    calculator.setOperation(.multiplication)
                }
            }
            
            // Row 3 - 4-5-6
            HStack(spacing: 12) {
                CalculatorButton(title: "4", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("4")
                }
                
                CalculatorButton(title: "5", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("5")
                }
                
                CalculatorButton(title: "6", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("6")
                }
                
                CalculatorButton(title: "-", backgroundColor: .orange, width: buttonSize, height: buttonSize) {
                    calculator.setOperation(.subtraction)
                }
            }
            
            // Row 4 - 1-2-3
            HStack(spacing: 12) {
                CalculatorButton(title: "1", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("1")
                }
                
                CalculatorButton(title: "2", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("2")
                }
                
                CalculatorButton(title: "3", backgroundColor: Color(.darkGray), width: buttonSize, height: buttonSize) {
                    calculator.appendDigit("3")
                }
                
                CalculatorButton(title: "+", backgroundColor: .orange, width: buttonSize, height: buttonSize) {
                    calculator.setOperation(.addition)
                }
            }
        }
    }
    
    private var trigFunctionsRow: some View {
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
