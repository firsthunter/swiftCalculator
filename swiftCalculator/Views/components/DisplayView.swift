import SwiftUI

struct DisplayView: View {
    let displayText: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text(displayText)
                .font(.system(size: 64, weight: .light))
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(Color.black)
        .cornerRadius(16)
    }
}

#Preview {
    DisplayView(displayText: "123.45")
        .padding()
        .background(Color.black)
}
