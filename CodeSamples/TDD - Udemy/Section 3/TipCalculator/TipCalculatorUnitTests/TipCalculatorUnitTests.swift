//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by Harold Davidson on 10/24/25.
//

// MARK: - Came from creating file
//import Testing

//struct TipCalculatorUnitTests {
//
//
//
//}

// MARK: - Old Way of Writing Tests
import XCTest

class when_calculating_tip_based_on_total_amount: XCTestCase {
    
    func test_should_calculate_tip_successfully() {
        let tipCalculator = TipCalculator()
        let tip = tipCalculator.calculate(total: 100, tipPercentage: 0.1)
        XCTAssertEqual(10, tip)
    }
}
