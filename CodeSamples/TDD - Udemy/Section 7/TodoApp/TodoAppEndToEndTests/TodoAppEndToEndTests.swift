//
//  TodoAppEndToEndTests.swift
//  TodoAppEndToEndTests
//
//  Created by Mohammad Azam on 10/19/21.
//

import XCTest

class when_app_is_launched: XCTestCase {

    func test_should_not_display_any_tasks() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let taskList = app.tables["taskList"]
        XCTAssertEqual(0, taskList.cells.count)
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
}

class when_user_saves_a_new_task: XCTestCase {
    
    func test_should_be_able_to_display_task_successfully() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()

        let titleTextField = app.textFields["titleTextField"]
        XCTAssertTrue(titleTextField.waitForExistence(timeout: 5))
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")

        // send Return to dismiss keyboard or ensure commit
        if app.keyboards.keys["Return"].exists {
            app.keyboards.keys["Return"].tap()
        } else if app.keyboards.buttons["return"].exists {
            app.keyboards.buttons["return"].tap()
        }

        let saveTaskButton = app.buttons["saveTaskButton"]
        XCTAssertTrue(saveTaskButton.waitForExistence(timeout: 5))
        saveTaskButton.tap()

        // Wait for the container (preferred) — use whichever identifier you applied
        let taskListContainer = app.otherElements["taskListContainer"]
        XCTAssertTrue(taskListContainer.waitForExistence(timeout: 8))

        // Now wait for the actual text of the row to appear
        let newTaskText = app.staticTexts["Mow the lawn"]
        XCTAssertTrue(newTaskText.waitForExistence(timeout: 8))
    }
    
    func test_display_error_message_for_duplicate_title_tasks() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
        
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")
        
        saveTaskButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        XCTAssertEqual(messageText.label, "Task is already added")
    }


    
    override func tearDown() {
        Springboard.deleteApp()
    }
}

class when_user_deletes_a_new_task: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
    }
    
    func test_should_delete_task_successfully() {
        let cell = app.tables["taskList"].cells["Mow the lawn, Medium"]
        
        cell.swipeLeft()
        app.tables["taskList"].buttons["Delete"].tap()
        XCTAssertFalse(cell.exists)
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
}

class when_user_marks_task_as_favorite: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let titleTextField = app.textFields["titleTextField"]
        titleTextField.tap()
        titleTextField.typeText("Mow the lawn")
        
        let saveTaskButton = app.buttons["saveTaskButton"]
        saveTaskButton.tap()
    }
    
    func test_should_display_updated_task_on_screen_as_favorite() {
        app.tables["taskList"].cells["Mow the lawn, Medium"].tap()
        app.images["favoriteImage"].tap()
        app.buttons["closeButton"].tap()
        
        XCTAssertTrue(app.tables["taskList"].cells["Mow the lawn, Love, Medium"].exists)
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
}
