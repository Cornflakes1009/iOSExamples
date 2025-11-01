//
//  TipCalculatorUITestsLaunchTests.swift
//  TipCalculatorUITests
//
//  Created by Harold Davidson on 10/30/25.
//

import XCTest

final class when_content_view_is_shown: XCTestCase {

    func test_should_make_sure_that_the_total_text_field_contains_default_value() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"] // set in ContentView in accessibilityIdentifier
        XCTAssertEqual(totalTextField.value as? String, "Enter total")
    }
    
    func test_should_make_sure_the_20_percent_default_tip_option_is_selected() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"] // set in ContentView in accessibilityIdentifier
        let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        
        XCTAssertEqual(segmentedControlButton.label, "20%")
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
}
