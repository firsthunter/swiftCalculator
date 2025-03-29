import SwiftUI

struct LandscapeButtonGrid: View {
    let calculator: CalculatorViewModel
    let geometry: GeometryProxy
    
    private var buttonSize: CGFloat {
        let availableWidth = geometry.size.width - 40
        let availableHeight = geometry.size.height * 0.7
        
        return min(
            (availableWidth - 6 * 12) / 7,
            (availableHeight - 4 * 12) / 5 // 5 rows with spacing
        )
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            leftSection
            rightSection
        }
    }
    
    private var leftSection: some View {
        VStack(spacing: 12) {
            topRow
            numberRows
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
        }
    }
    
    private var topRow: some View {
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
    
    private var numberRows: some View {
        Group {
            // Row 2 - 7-8-9, multiply
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
    
    private var rightSection: some View {
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
