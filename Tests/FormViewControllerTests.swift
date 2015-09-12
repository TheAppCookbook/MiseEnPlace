//
//  FormViewControllerTests.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import XCTest

class FormViewControllerTests: XCTestCase {
    // MARK: Setup
    override func setUp() {
        super.setUp()
        self.continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    // MARK: Tests
    func testForm() {
        let tablesQuery = XCUIApplication().tables
        tablesQuery.cells["FormTests"].tap()
        
        let usernameField = tablesQuery.textFields["FormUsernameInput"]
        let passwordField = tablesQuery.secureTextFields["FormPasswordInput"]
        let doneButton = tablesQuery.buttons["FormDoneButton"]
        
        usernameField.tap()
        usernameField.typeText("test_username")
        XCTAssertFalse(doneButton.enabled)
        
        passwordField.tap()
        passwordField.typeText("012345678")
        XCTAssertFalse(doneButton.enabled)
        
        passwordField.typeText("9")
        XCTAssertTrue(doneButton.enabled)
        
        doneButton.tap()
    }
}
