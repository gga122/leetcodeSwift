//
//  RepeatedSubstringPattern.swift
//  leetcode
//
//  Created by Henry on 2019/5/13.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RepeatedSubstringPatternSolution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        if s.count <= 1 {
            return false
        }
        let chars = Array(s)
        if s.count == 2 {
            return chars[0] == chars[1]
        }
        
        /* Calculate all pattern lengths */
        let count = chars.count
        var patternLengths = [Int]()
        for i in 1...count / 2 { // Start from length 1, because we MUST handle 'zzz' pattern
            if count % i == 0 {
                patternLengths.append(i)
            }
        }
        if patternLengths.count == 0 {
            return false
        }
  
        for length in patternLengths {
            var matched = true
            let elementCount = count / length
            var set = Set<String>.init()
            /* Construct all subStrings */
            for i in 0..<elementCount {
                var subString = ""
                for j in 0..<length {
                    let c = chars[i * length + j]
                    subString.append(c)
                }
                if set.count == 0 {
                    set.insert(subString)
                } else {
                    if !set.contains(subString) {
                        matched = false
                        break
                    }
                }
            }
            if matched {
                return true
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(repeatedSubstringPattern("abab"))
        print(repeatedSubstringPattern("aba"))
        print(repeatedSubstringPattern("abcabcabcabc"))
        print(repeatedSubstringPattern("zzz"))
    }
}
