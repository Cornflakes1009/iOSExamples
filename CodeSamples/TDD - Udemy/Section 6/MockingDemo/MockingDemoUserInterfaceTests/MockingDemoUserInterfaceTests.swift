//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Harold Davidson on 11/17/25.
//

import XCTest

final class when_user_taps_on_login_button: XCTestCase {
    
    private var app: XCUIApplication!
    private var loginPageObject: LoginPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        self.loginPageObject = LoginPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
    }
    
    func test_text_should_display_error_message_for_missing_required_fields() {
        
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    func test_should_display_error_message_for_invalid_credentials() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("WrongPassword")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        XCTAssertEqual(messageText.label, "Invalid credentials")
    }
    
    func test_should_navigate_to_dashboard_screen_when_authenticated() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let dashboardNavTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavTitle.waitForExistence(timeout: 0.5))
    }
}
