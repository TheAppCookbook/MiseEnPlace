//
//  TableViewPaginationTests.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import XCTest

class TableViewPaginationTests: XCTestCase {
    // MARK: Tests
    func testReloadDataCallback() {
        let expectation = self.expectationWithDescription("👍 completion was called")
        
        let tableVC = UITableViewController()
        tableVC.reloadData {
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5.0,
            handler: nil)
    }
    
    func testAppendPageCallback() {
        let expectation = self.expectationWithDescription("👍 completion was called")
        
        let tableVC = UITableViewController()
        tableVC.appendNextPage {
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5.0,
            handler: nil)
    }
}
