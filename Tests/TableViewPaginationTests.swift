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
    func testTableViewReloadDataCallback() {
        let expectation = self.expectationWithDescription("👍 completion was called")
        
        let tableVC = UITableViewController()
        tableVC.reloadData {
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5.0,
            handler: nil)
    }
    
    func testTableViewAppendPageCallback() {
        let expectation = self.expectationWithDescription("👍 completion was called")
        
        let tableVC = UITableViewController()
        tableVC.appendNextPage {
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5.0,
            handler: nil)
    }
    
    func testCollectionViewReloadDataCallback() {
        let expectation = self.expectationWithDescription("👍 completion was called")
        
        let collectionVC = UICollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        collectionVC.reloadData {
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5.0,
            handler: nil)
    }
    
    func testAppendPageCallback() {
        let expectation = self.expectationWithDescription("👍 completion was called")
        
        let collectionVC = UICollectionViewController()
        collectionVC.appendNextPage {
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(5.0,
            handler: nil)
    }
}
