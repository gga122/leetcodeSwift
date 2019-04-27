//
//  ValidAnagram.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ValidAnagramSolution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        
        var sChars = Dictionary<Character, Int>.init()
        for sChar in s {
            var count = sChars[sChar]
            if count == nil {
                count = 1
            } else {
                count! += 1
            }
            sChars[sChar] = count
        }
        var tChars = Dictionary<Character, Int>.init()
        for tChar in t {
            var count = tChars[tChar]
            if count == nil {
                count = 1
            } else {
                count! += 1
            }
            tChars[tChar] = count
        }
        
        for (char, count) in sChars {
            if tChars[char] != count {
                return false
            }
        }
        return true
    }
    
    func test() -> Void {
        print(isAnagram("anagram", "nagaram"))
        print(isAnagram("rat", "car"))
    }
}
