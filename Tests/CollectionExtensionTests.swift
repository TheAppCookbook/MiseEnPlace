//
//  CollectionExtensionTests.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/19/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import XCTest

func ==(lhs: User, rhs: User) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

struct User: Hashable {
    let id: Int
    let name: String
    var hashValue: Int { return self.id }
}


class CollectionExtensionTests: XCTestCase {

    func testSimpleMerge() {
        let x = [0, 2, 3, 9]
        let y = [1, 2, 5, 8, 7]
        
        let z = x.merged(y)
        XCTAssertEqual(z, [0, 1, 2, 5, 3, 8, 9, 7])
    }
    
    func testComplexMerge() {
        let oldData = [
            User(id: 0, name: "Matthew"),
            User(id: 1, name: "Glenn"),
            User(id: 2, name: "Carrie"),
            User(id: 3, name: "Eryn")
        ]
        
        let newData = [
            User(id: 3, name: "Erica"),
            User(id: 4, name: "Matt")
        ]
        
        let indices = oldData.merged(newData).map { $0.id }
        XCTAssertEqual(indices, [0, 3, 4, 1, 2])
    }

}
