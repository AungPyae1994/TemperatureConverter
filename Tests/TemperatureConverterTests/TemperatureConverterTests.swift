import XCTest
@testable import TemperatureConverter

final class TemperatureConverterTests: XCTestCase {
    
    // MARK: - Standard Temperature Tests
    
    func test300KelvinToCelsius() {
        let result = TemperatureConverter.celsius(from: 300)
        
        XCTAssertEqual(result!, 26.85, accuracy: 0.01)
    }
    
    func test300KelvinToFahrenheit() {
        let result = TemperatureConverter.fahrenheit(from: 300)
        
        XCTAssertEqual(result!, 80.33, accuracy: 0.01)
    }
    
    // MARK: - Absolute Zero Tests
    
    func testAbsoluteZero() {
        let celsius = TemperatureConverter.celsius(from: 0)
        let fahrenheit = TemperatureConverter.fahrenheit(from: 0)
        
        XCTAssertEqual(celsius!, -273.15, accuracy: 0.01)
        XCTAssertEqual(fahrenheit!, -459.67, accuracy: 0.01)
    }
    
    // MARK: - Missing Temperature Tests
    
    func testNilTemperature() {
        let celsius = TemperatureConverter.celsius(from: nil)
        let fahrenheit = TemperatureConverter.fahrenheit(from: nil)
        
        XCTAssertNil(celsius)
        XCTAssertNil(fahrenheit)
    }
    
    // MARK: - Invalid Temperature Tests
    
    func testBelowAbsoluteZero() {
        let celsius = TemperatureConverter.celsius(from: -10)
        let fahrenheit = TemperatureConverter.fahrenheit(from: -10)
        
        XCTAssertNil(celsius)
        XCTAssertNil(fahrenheit)
    }
    
    func testUnexpectedLargeTemperature() {
        let celsius = TemperatureConverter.celsius(from: 100000)
        let fahrenheit = TemperatureConverter.fahrenheit(from: 100000)
        
        XCTAssertNil(celsius)
        XCTAssertNil(fahrenheit)
    }

    func testCelsiusAndFahrenheitConsistency() {
    let celsius = TemperatureConverter.celsius(from: 300)!
    let fahrenheit = TemperatureConverter.fahrenheit(from: 300)!
    
    let expectedFahrenheit = (celsius * 9 / 5) + 32
    
    XCTAssertEqual(fahrenheit, expectedFahrenheit, accuracy: 0.01)
    }
}
