//
//  KeyboardLayoutConstrainTests.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import XCTest

class KeyboardLayoutConstrainTests: XCTestCase {
    // MARK: Setup
    override func setUp() {
        super.setUp()
        self.continueAfterFailure = false
        XCUIApplication().launch()
    }

    // MARK: Tests
    func testKeyboard() {
        let app = XCUIApplication()
        let windowMaxY = app.windows.elementBoundByIndex(0).frame.maxY
        
        app.tables.cells["KeyboardTests"].tap()
        let canaryViewElement = app.otherElements["KBTestCanaryView"]
        
        do {
            let preDistanceFromBottom = windowMaxY - canaryViewElement.frame.maxY
            XCTAssertEqual(preDistanceFromBottom, 20.0)
            
            app.textFields["KBTestTextField"].tap()
            let postDistanceFromBottom = windowMaxY - canaryViewElement.frame.maxY
            XCTAssertGreaterThan(postDistanceFromBottom, preDistanceFromBottom)
        }
        
        do {
            canaryViewElement.tap()
            let postDistanceFromBottom = windowMaxY - canaryViewElement.frame.maxY
            XCTAssertEqual(postDistanceFromBottom, 20.0)
        }
        
        app.navigationBars["MiseEnPlace.KeyboardTestView"].buttons["Root View Controller"].tap()
    }
}
