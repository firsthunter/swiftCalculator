
import XCTest
@testable import swiftCalculator

final class swiftCalculatorTests: XCTestCase {
    
    var viewModel: CalculatorViewModel!
    
    override func setUpWithError() throws {
        viewModel = CalculatorViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testInitialState() throws {
        XCTAssertEqual(viewModel.displayText, "0")
    }
    
    func testClear() throws {
        viewModel.appendDigit("5")
        XCTAssertEqual(viewModel.displayText, "5")
        
        viewModel.clear()
        
        XCTAssertEqual(viewModel.displayText, "0")
    }
    
    func testAppendDigit() throws {
        viewModel.appendDigit("1")
        XCTAssertEqual(viewModel.displayText, "1")
        
        viewModel.appendDigit("2")
        XCTAssertEqual(viewModel.displayText, "12")
        
        viewModel.appendDigit(".")
        XCTAssertEqual(viewModel.displayText, "12.")
        
        viewModel.appendDigit("5")
        XCTAssertEqual(viewModel.displayText, "12.5")
        
        viewModel.appendDigit(".")
        XCTAssertEqual(viewModel.displayText, "12.5")
    }
    
    func testReplaceInitialZero() throws {
        XCTAssertEqual(viewModel.displayText, "0")
        viewModel.appendDigit("7")
        XCTAssertEqual(viewModel.displayText, "7")
    }
    
    func testAddition() throws {
        // Test addition: 5 + 3 = 8
        viewModel.appendDigit("5")
        viewModel.setOperation(.addition)
        viewModel.appendDigit("3")
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.displayText, "8")
    }
    
    func testSubtraction() throws {
        // Test subtraction: 10 - 4 = 6
        viewModel.appendDigit("1")
        viewModel.appendDigit("0")
        viewModel.setOperation(.subtraction)
        viewModel.appendDigit("4")
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.displayText, "6")
    }
    
    func testMultiplication() throws {
        // Test multiplication: 6 * 7 = 42
        viewModel.appendDigit("6")
        viewModel.setOperation(.multiplication)
        viewModel.appendDigit("7")
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.displayText, "42")
    }
    
    func testDivision() throws {
        // Test division: 20 / 5 = 4
        viewModel.appendDigit("2")
        viewModel.appendDigit("0")
        viewModel.setOperation(.division)
        viewModel.appendDigit("5")
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.displayText, "4")
    }
    
    func testChainedOperations() throws {
        // Test chained operations: 5 + 3 * 2 = 16 (not 11)
        viewModel.appendDigit("5")
        viewModel.setOperation(.addition)
        viewModel.appendDigit("3")
        viewModel.setOperation(.multiplication)
        viewModel.appendDigit("2")
        viewModel.calculate()
        
        XCTAssertEqual(viewModel.displayText, "16")
    }
    
    func testToggleSign() throws {
        // Test sign toggle
        viewModel.appendDigit("5")
        viewModel.toggleSign()
        XCTAssertEqual(viewModel.displayText, "-5")
        
        viewModel.toggleSign()
        XCTAssertEqual(viewModel.displayText, "5")
    }
    
    func testPercentage() throws {
        // Test percentage: 50% = 0.5
        viewModel.appendDigit("5")
        viewModel.appendDigit("0")
        viewModel.percentage()
        XCTAssertEqual(viewModel.displayText, "0.5")
    }
    
    func testPi() throws {
        // Test inputting Pi
        viewModel.inputPi()
        XCTAssertEqual(viewModel.displayText, "3.141592653589793")
    }
    
    func testSineOperation() throws {
        // Test sine: sin(90°) = 1
        viewModel.appendDigit("9")
        viewModel.appendDigit("0")
        viewModel.setOperation(.sine)
        
        let value = Double(viewModel.displayText) ?? 0
        XCTAssertEqual(value, 1.0, accuracy: 0.0001)
    }
    
    func testCosineOperation() throws {
        // Test cosine: cos(0°) = 1
        viewModel.appendDigit("0")
        viewModel.setOperation(.cosine)
        
        let value = Double(viewModel.displayText) ?? 0
        XCTAssertEqual(value, 1.0, accuracy: 0.0001)
    }
    
    func testTangentOperation() throws {
        // Test tangent: tan(45°) = 1
        viewModel.appendDigit("4")
        viewModel.appendDigit("5")
        viewModel.setOperation(.tangent)
        
        let value = Double(viewModel.displayText) ?? 0
        XCTAssertEqual(value, 1.0, accuracy: 0.0001)
    }
}
