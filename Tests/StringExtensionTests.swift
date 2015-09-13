//
//  StringExtensionTests.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import XCTest

class StringExtensionTests: XCTestCase {
    func testContainsEmoji() {
        XCTAssertFalse("NO".containsEmoji)
        XCTAssertTrue("🔑".containsEmoji)
    }
}
