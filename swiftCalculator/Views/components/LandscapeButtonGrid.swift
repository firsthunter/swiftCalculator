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
            LeftSection(calculator: calculator, buttonSize: buttonSize)
            RightSection(calculator: calculator, buttonSize: buttonSize)
        }
    }
}
