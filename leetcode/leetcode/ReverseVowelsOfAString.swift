//
//  ReverseVowelsOfAString.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReverseVowelsOfAStringSolution {
    func reverseVowels(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }
        
        var chars = Array(s)
        var start = 0
        var end = chars.count - 1
        let vowelSet: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        while start < end {
            let cStart = chars[start]
            if !vowelSet.contains(cStart) {
                start += 1
                continue
            }
            let cEnd = chars[end]
            if !vowelSet.contains(cEnd) {
                end -= 1
                continue
            }
            chars[start] = cEnd
            chars[end] = cStart
            start += 1
            end -= 1
        }
        
        return String(chars)
    }
    
    func test() -> Void {
        print(reverseVowels("hello"))
        print(reverseVowels("leetcode"))
    }
}
