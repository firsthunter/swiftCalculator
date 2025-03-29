import SwiftUI


struct CalculatorButton: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    init(
        title: String,
        backgroundColor: Color,
        foregroundColor: Color = .white,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.width = width ?? 70
        self.height = height ?? 70
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: min(width, height) * 0.4))
                .fontWeight(.medium)
                .foregroundColor(foregroundColor)
                .frame(width: width, height: height)
                .background(backgroundColor)
                .cornerRadius(min(width, height) / 2)
        }
    }
}

#Preview {
    HStack {
        CalculatorButton(title: "1", backgroundColor: .gray) {}
        CalculatorButton(title: "+", backgroundColor: .orange) {}
    }
}
