//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Harold Davidson on 11/17/25.
//

import XCTest

final class when_user_taps_on_login_button: XCTestCase {
    
    func test_text_should_display_error_message_for_missing_required_fields() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
}
