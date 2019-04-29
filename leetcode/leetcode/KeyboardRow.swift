//
//  KeyboardRow.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class KeyboardRowSolution {
    func findWords(_ words: [String]) -> [String] {
        if words.count == 0 {
            return []
        }
        
        let dic: Dictionary = ["Q": 0, "W": 0, "E": 0, "R": 0, "T": 0, "Y": 0, "U": 0, "I": 0, "O": 0, "P": 0, "A": 1, "S": 1, "D": 1, "F": 1, "G": 1, "H": 1, "J": 1, "K": 1, "L": 1, "Z": 2, "X": 2, "C": 2, "V": 2, "B": 2, "N": 2, "M": 2]
        
        var ret = [String]()
        for word in words {
            var matched = true
            var oldIndex = -1
            for c in word {
                let upper = String(c).uppercased()
                let index = dic[upper]
                if oldIndex < 0 {
                    oldIndex = index!
                } else if index != oldIndex {
                    matched = false
                    break
                }
            }
            
            if matched {
                ret.append(word)
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(findWords(["Hello", "Alaska", "Dad", "Peace"]))
    }
}
