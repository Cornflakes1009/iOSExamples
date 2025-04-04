//
//  CalculationTests.swift
//  UnitTestingTipCalculatorExampleTests
//
//  Created by Harold Davidson on 4/3/25.
//

import XCTest
@testable import UnitTestingTipCalculatorExample // must import the file you need

final class CalculationTests: XCTestCase {
    
    func testSuccessfulTipCalculation() {
        // Given (arrange)
        let enteredAmount = 100.00
        let tipSlider = 25.0
        let calculation = Calculation()
        
        // When (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertEqual(tip, 25)
    }

    func testNegativeEnteredAmountTipCalculation() {
        // Given (arrange)
        let enteredAmount = -100.00
        let tipSlider = 25.0
        let calculation = Calculation()
        
        // When (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertNil(tip)
    }
}
