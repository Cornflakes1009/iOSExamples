//
//  Springboard.swift
//  TodoAppEndToEndTests
//
//  Created by Harold Davidson on 11/30/25.
//

import XCTest

class Springboard {
    
    static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    class func deleteApp() {
        let app = XCUIApplication()
        app.terminate()
        
        springboard.activate()
        
        let icon = springboard.icons["TodoApp"]
        
        guard icon.waitForExistence(timeout: 5) else {
            XCTFail("App icon not found on the home screen.")
            return
        }
        
        // Long press to open the menu
        icon.press(forDuration: 1.2)
        
        // Tap "Remove App"
        let removeAppButton = springboard.buttons["Remove App"]
        XCTAssertTrue(removeAppButton.waitForExistence(timeout: 2))
        removeAppButton.tap()
        
        // Tap "Delete App"
        let deleteAppButton = springboard.buttons["Delete App"]
        XCTAssertTrue(deleteAppButton.waitForExistence(timeout: 2))
        deleteAppButton.tap()
        
        // Final confirmation alert (Cancel / Delete)
        let finalDeleteButton = springboard.alerts.buttons["Delete"]
        XCTAssertTrue(finalDeleteButton.waitForExistence(timeout: 2))
        finalDeleteButton.tap()
    }
}
