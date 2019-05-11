//
//  CountBinarySubstrings.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CountBinarySubstringsSolution {
    func countBinarySubstrings(_ s: String) -> Int {
        if s.count <= 1 {
            return 0
        }
        
        let chars = Array(s)
        var ret = 0
        var previousCount = 0
        var currentCount = 1
        for i in 1..<chars.count {
            if chars[i] == chars[i - 1] {
                currentCount += 1
            } else {
                previousCount = currentCount
                currentCount = 1
            }
            
            if previousCount >= currentCount {
                ret += 1
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(countBinarySubstrings("00110011"))
        print(countBinarySubstrings("10101"))
        print(countBinarySubstrings("00110"))
    }
}
