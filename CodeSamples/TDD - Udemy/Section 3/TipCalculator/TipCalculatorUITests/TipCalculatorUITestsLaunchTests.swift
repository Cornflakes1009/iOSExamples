//
//  TipCalculatorUITestsLaunchTests.swift
//  TipCalculatorUITests
//
//  Created by Harold Davidson on 10/30/25.
//

import XCTest

final class when_content_view_is_shown: XCTestCase {

    private var app: XCUIApplication!
    
    // this runs before every test case. Not just once.
    override func setUp() { // make sure you don't use the CLASS version
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_make_sure_that_the_total_text_field_contains_default_value() {
        
        
        let totalTextField = app.textFields["totalTextField"] // set in ContentView in accessibilityIdentifier
        XCTAssertEqual(totalTextField.value as? String, "Enter total")
    }
    
    func test_should_make_sure_the_20_percent_default_tip_option_is_selected() {
        
        let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"] // set in ContentView in accessibilityIdentifier
        let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        
        XCTAssertEqual(segmentedControlButton.label, "20%")
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
    
    // runs after each test has been ran
    override func tearDown() {
        // clean up
    }
}

class when_calculate_tip_button_is_pressed: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("100")
        
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
    }
    
    func test_should_make_sure_that_tip_is_displayed_on_the_screen() {
        let tipText = app.staticTexts["tipText"]
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "$20.00")
    }
}
