//
//  Single-RowKeyboard.swift
//  leetcode
//
//  Created by MickyZhu on 5/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class Single_RowKeyboardSolution {
    func calculateTime(_ keyboard: String, _ word: String) -> Int {
        var indexes = [Character: Int]()
        let keys = Array(keyboard)
        for i in 0..<keys.count {
            indexes[keys[i]] = i
        }
        
        var time = 0
        var previous = 0
        for w in word {
            if let index = indexes[w] {
                time += abs(index-previous)
                previous = index
            }
        }
        
        return time
    }
    
    func test() -> Void {
        print(calculateTime("abcdefghijklmnopqrstuvwxyz", "cba"))
        print(calculateTime("pqrstuvwxyzabcdefghijklmno", "leetcode"))
    }
}
