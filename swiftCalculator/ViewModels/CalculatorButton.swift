import SwiftUI

struct CalculatorButton: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color = .white
    var width: CGFloat = 70
    var height: CGFloat = 70
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .frame(width: width, height: height)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(height / 2)
        }
    }
}

#Preview {
    HStack {
        CalculatorButton(title: "1", backgroundColor: .gray) {}
        CalculatorButton(title: "+", backgroundColor: .orange) {}
    }
}
