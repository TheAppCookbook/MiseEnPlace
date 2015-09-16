//
//  StringExtensions.swift
//  MiseEnPlace
//
//  Created by PATRICK PERINI on 9/12/15.
//  Copyright © 2015 pcperini. All rights reserved.
//

import Foundation

public extension String {
    // MARK: Properties
    public var containsEmoji: Bool {
        for scalar in self.unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F,   // Emoticons
              0x1F300...0x1F5FF,      // Misc Symbols and Pictographs
              0x1F680...0x1F6FF,      // Transport and Map
              0x2600...0x26FF,        // Misc symbols, not all emoji
              0x2700...0x27BF:        // Dingbats, not all emoji
                return true
                
            default:
                break
            }
        }
        
        return false
    }
}