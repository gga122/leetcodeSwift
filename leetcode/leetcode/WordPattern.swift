//
//  WordPattern.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class WordPatternSolution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let subStrings = str.split(separator: " ")
        let chars = Array(pattern)
        if subStrings.count != chars.count {
            return false
        }
        
        var hashs1 = [Character: String]()
        var hashs2 = [String: Character]()
        for i in 0..<subStrings.count {
            let char = chars[i]
            let subString = String(subStrings[i])
            if let string = hashs1[char] {
                if subString != string {
                    return false
                }
            } else {
                if let c = hashs2[subString] {
                    if c != char {
                        return false
                    }
                } else {
                    hashs1[char] = subString
                    hashs2[subString] = char
                }
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(wordPattern("abba", "dog cat cat dog"))
        print(wordPattern("abba", "dog cat cat fish"))
        print(wordPattern("aaaa", "dog cat cat dog"))
        print(wordPattern("abba", "dog dog dog dog"))
    }
}
