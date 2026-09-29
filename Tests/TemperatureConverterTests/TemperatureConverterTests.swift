import XCTest
@testable import TemperatureConverter

final class TemperatureConverterTests: XCTestCase {
    
    func test300KelvinToCelsius() {
        let result = TemperatureConverter.celsius(from: 300)
        XCTAssertEqual(result!, 26.85, accuracy: 0.01)
    }
    
    func test300KelvinToFahrenheit() {
        let result = TemperatureConverter.fahrenheit(from: 300)
        XCTAssertEqual(result!, 80.33, accuracy: 0.01)
    }
    
    func testAbsoluteZero() {
        let result = TemperatureConverter.celsius(from: 0)
        XCTAssertEqual(result!, -273.15, accuracy: 0.01)
    }
    
    func testNilTemperature() {
        let result = TemperatureConverter.celsius(from: nil)
        XCTAssertNil(result)
    }
    
    func testBelowAbsoluteZero() {
        let result = TemperatureConverter.celsius(from: -10)
        XCTAssertNil(result)
    }
    
    func testUnexpectedLargeTemperature() {
    let result = TemperatureConverter.celsius(from: 100000)
    XCTAssertNil(result)
    }
}
