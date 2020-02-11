//
//  SortCharactersByFrequency.swift
//  leetcode
//
//  Created by MickyZhu on 11/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class SortCharactersByFrequencySolution {
    func frequencySort(_ s: String) -> String {
        var map = [Character: Int]()
        let chars = Array(s)
        
        for i in 0..<chars.count {
            let c = chars[i]
            if let count = map[c] {
                map[c] = count + 1
            } else {
                map[c] = 1
            }
        }
        
        let sorted = map.sorted { (entry1, entry2) -> Bool in
            return entry1.value > entry2.value
        }
        
        var newChars = [Character]()
        for (k, v) in sorted {
            for _ in 0..<v {
                newChars .append(k)
            }
        }
        
        let newS = String(newChars)
        
        return newS
    }
    
    func test() -> Void {
        print(frequencySort("tree"))
        print(frequencySort("cccaaa"))
        print(frequencySort("Aabb"))
    }
}
