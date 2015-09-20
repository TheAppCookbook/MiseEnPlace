//
//  CollectionExtensions.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/19/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import Foundation

public extension RangeReplaceableCollectionType where Generator.Element: Equatable {
    public mutating func removeObject(object: Generator.Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
}

private func <<I, V>(lhs: IndexedElement<I, V>, rhs: IndexedElement<I, V>) -> Bool {
    return lhs.index < rhs.index
}

private func ==<I, V>(lhs: IndexedElement<I, V>, rhs: IndexedElement<I, V>) -> Bool {
    return lhs.value.hashValue == rhs.value.hashValue
}

private struct IndexedElement<IndexType, ValueType where IndexType: Comparable, ValueType: Hashable>: Comparable, Hashable {
    let index: IndexType
    let value: ValueType
    
    var hashValue: Int {
        return self.value.hashValue
    }
}

public extension CollectionType where Generator.Element: Hashable, Index: Comparable {
    func merged(collection: Self) -> [Self.Generator.Element] {
        typealias indexedElement = IndexedElement<Index, Generator.Element>
        
        let lhs = self.map {
            indexedElement(index: self.indexOf($0)!,
                value: $0)
        }
        
        let rhs = collection.map {
            indexedElement(index: collection.indexOf($0)!,
                value: $0)
        }
        
        var set = Set<indexedElement>()
        set.unionInPlace(lhs)
        set.unionInPlace(rhs)
        
        let result = set.sort()
        return result.map { $0.value }
    }
}