
import XCTest
@testable import swiftCalculator

final class swiftCalculatorTests: XCTestCase {
    
    var viewModel: CalculatorViewModel!
    
    override func setUpWithError() throws {
        // Initialize a fresh calculator view model before each test
        viewModel = CalculatorViewModel()
    }
    
    override func tearDownWithError() throws {
        // Clean up after each test
        viewModel = nil
    }
    
    func testInitialState() throws {
        // Test that calculator view model initializes with correct display value
        XCTAssertEqual(viewModel.displayText, "0")
    }
    
    func testClear() throws {
        // Change the calculator state
        viewModel.appendDigit("5")
        XCTAssertEqual(viewModel.displayText, "5")
        
        // Clear the calculator
        viewModel.clear()
        
        // Verify cleared state
        XCTAssertEqual(viewModel.displayText, "0")
    }
    
    func testAppendDigit() throws {
        // Test digit append behavior
        viewModel.appendDigit("1")
        XCTAssertEqual(viewModel.displayText, "1")
        
        viewModel.appendDigit("2")
        XCTAssertEqual(viewModel.displayText, "12")
        
        // Test decimal
        viewModel.appendDigit(".")
        XCTAssertEqual(viewModel.displayText, "12.")
        
        viewModel.appendDigit("5")
        XCTAssertEqual(viewModel.displayText, "12.5")
        
        // Test not allowing multiple decimal points
        viewModel.appendDigit(".")
        XCTAssertEqual(viewModel.displayText, "12.5")
    }
    
    func testReplaceInitialZero() throws {
        // First digit should replace initial zero
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
        
        // Check with approximate equality to handle floating point precision
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
