//
//  Dictionary+EXT.swift
//  AIChat
//
//  Created by Ricardo Garza on 4/11/25.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    
    var asAlphabeticalArray: [(key: String, value: Any)] {
        self.map({ (key: $0, value: $1) }).sortedByKeyPath(keyPath: \.key)
    }
}
