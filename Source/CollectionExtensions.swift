//
//  CollectionExtensions.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/19/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import Foundation

// MARK: Replacing
public extension RangeReplaceableCollectionType where Generator.Element: Equatable {
    public mutating func removeObject(object: Generator.Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
}

// MARK: Sorting
//private func <<I, V>(lhs: IndexedElement<I, V>, rhs: IndexedElement<I, V>) -> Bool {
//    return lhs.index < rhs.index
//}
//
//private func ==<I, V>(lhs: IndexedElement<I, V>, rhs: IndexedElement<I, V>) -> Bool {
//    return lhs.value.hashValue == rhs.value.hashValue
//}
//
//private struct IndexedElement<IndexType, ValueType where IndexType: Comparable, ValueType: Hashable>: Comparable, Hashable {
//    let index: IndexType
//    let value: ValueType
//    
//    var hashValue: Int {
//        return self.value.hashValue
//    }
//}

public extension CollectionType where Generator.Element: Hashable, Index: Comparable {
    func merged(collection: Self) -> [Self.Generator.Element] {
        var lhs = self.map { $0 }
        for element in collection {
            if let index = lhs.indexOf(element) {
                lhs[index] = element
            } else {
                lhs.append(element)
            }
        }
        
        return lhs
    }
}