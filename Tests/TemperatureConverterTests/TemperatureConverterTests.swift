import XCTest
@testable import TemperatureConverter

final class TemperatureConverterTests: XCTestCase {

    // MARK: - 1a. Standard Temperature Conversion Tests

    func testKelvinToCelsiusMultipleValues() {
        let testCases = [
            (kelvin: 273.15, expected: 0.00),
            (kelvin: 300.00, expected: 26.85),
            (kelvin: 310.00, expected: 36.85)
        ]

        for testCase in testCases {
            let result = TemperatureConverter.celsius(from: testCase.kelvin)

            XCTAssertNotNil(result)

            XCTAssertEqual(
                result!,
                testCase.expected,
                accuracy: 0.01,
                "\(testCase.kelvin) K should convert to \(testCase.expected) °C"
            )
        }
    }

    func testKelvinToFahrenheitMultipleValues() {
        let testCases = [
            (kelvin: 273.15, expected: 32.00),
            (kelvin: 300.00, expected: 80.33),
            (kelvin: 310.00, expected: 98.33)
        ]

        for testCase in testCases {
            let result = TemperatureConverter.fahrenheit(from: testCase.kelvin)

            XCTAssertNotNil(result)

            XCTAssertEqual(
                result!,
                testCase.expected,
                accuracy: 0.01,
                "\(testCase.kelvin) K should convert to \(testCase.expected) °F"
            )
        }
    }

    func testCelsiusAndFahrenheitConsistency() {
        let kelvin = 300.0

        let celsius = TemperatureConverter.celsius(from: kelvin)
        let fahrenheit = TemperatureConverter.fahrenheit(from: kelvin)

        XCTAssertNotNil(celsius)
        XCTAssertNotNil(fahrenheit)

        let expectedFahrenheit = (celsius! * 9 / 5) + 32

        XCTAssertEqual(
            fahrenheit!,
            expectedFahrenheit,
            accuracy: 0.01
        )
    }


    // MARK: - 1b. Edge Cases and Invalid Values

    func testAbsoluteZero() {
        let celsius = TemperatureConverter.celsius(from: 0)
        let fahrenheit = TemperatureConverter.fahrenheit(from: 0)

        XCTAssertNotNil(celsius)
        XCTAssertNotNil(fahrenheit)

        XCTAssertEqual(
            celsius!,
            -273.15,
            accuracy: 0.01
        )

        XCTAssertEqual(
            fahrenheit!,
            -459.67,
            accuracy: 0.01
        )
    }

    func testNilTemperature() {
        let celsius = TemperatureConverter.celsius(from: nil)
        let fahrenheit = TemperatureConverter.fahrenheit(from: nil)

        XCTAssertNil(celsius)
        XCTAssertNil(fahrenheit)
    }

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
}
