//
//  TipCalculatorUITestsLaunchTests.swift
//  TipCalculatorUITests
//
//  Created by Harold Davidson on 10/30/25.
//

import XCTest

final class when_content_view_is_shown: XCTestCase {

    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    // this runs before every test case. Not just once.
    override func setUp() { // make sure you don't use the CLASS version
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_make_sure_that_the_total_text_field_contains_default_value() {
        
        
        //let totalTextField = app.textFields["totalTextField"] // set in ContentView in accessibilityIdentifier
        XCTAssertEqual(contentViewPage.totalTextField.value as? String, "Enter total")
    }
    
    func test_should_make_sure_the_20_percent_default_tip_option_is_selected() {
        
//        let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmentedControl"] // set in ContentView in accessibilityIdentifier
//        let segmentedControlButton = tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        
        let segmentedControlButton = contentViewPage.tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        XCTAssertEqual(segmentedControlButton.label, "20%")
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
    
    // runs after each test has been ran
    override func tearDown() {
        // clean up
    }
}

class when_calculate_tip_button_is_pressed_for_valid_input: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        //let totalTextField = app.textFields["totalTextField"]
        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("100")
        
        //let calculateTipButton = app.buttons["calculateTipButton"]
        let calculateTipButton = contentViewPage.calculateTipButton
        calculateTipButton.tap()
    }
    
    func test_should_make_sure_that_tip_is_displayed_on_the_screen() {
        
        //let tipText = app.staticTexts["tipText"]
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "$20.00")
    }
    
    // This test created using the Recording Tool
    // press the record button (located near where you turn breakpoints on/off) in the bottom left of the code
    func test_should_make_sure_that_tip_is_displayed_on_the_screen_2() {
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.textFields["totalTextField"]/*[[".otherElements",".textFields[\"Enter total\"]",".textFields[\"totalTextField\"]",".textFields.firstMatch"],[[[-1,2],[-1,1],[-1,3],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["totalTextField"]/*[[".otherElements",".textFields[\"Enter total\"]",".textFields[\"totalTextField\"]",".textFields.firstMatch"],[[[-1,2],[-1,1],[-1,3],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.typeText("100")
        app.buttons["30%"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["calculateTipButton"]/*[[".otherElements",".buttons[\"Calculate Tip\"]",".buttons[\"calculateTipButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let tipText = app.staticTexts["tipText"]
        XCTAssertEqual("$30.00", tipText.label)
    }
}

class when_calculate_tip_button_is_pressed_for_invalid_input: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        //let totalTextField = app.textFields["totalTextField"]
        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        //let calculateTipButton = app.buttons["calculateTipButton"]
        let calculateTipButton = contentViewPage.calculateTipButton
        calculateTipButton.tap()
    }
    
    func test_should_clear_the_tip_label_for_invalid_input() {
        
        //let tipText = app.staticTexts["tipText"]
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(tipText.label, "")
    }
    
    func test_should_display_error_message_for_invalid_input() {

        //let messageText = app.staticTexts["messageText"]
        let messageText = contentViewPage.messageText
        let _ = messageText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(messageText.label, "Invalid Input")
    }
}
