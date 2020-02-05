//
//  CountSubstringsWithOnlyOneDistinctLetter.swift
//  leetcode
//
//  Created by MickyZhu on 5/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class CountSubstringsWithOnlyOneDistinctLetterSolution {
    func countLetters(_ S: String) -> Int {
        let chars = Array(S)
        if chars.count == 0 {
            return 0
        }
        
        var parts = [Int]()
        var lastChar:Character? = nil
        var count = 0
        for c in chars {
            if lastChar == nil {
                lastChar = c
                count += 1
            } else {
                if lastChar! == c {
                    count += 1
                } else {
                    lastChar = c
                    parts.append(count)
                    count = 1
                }
            }
        }
        if count != 0 {
            parts.append(count)
        }
        
        var res = 0
        for n in parts {
            if n == 1 {
                res += 1
                continue
            } else {
                res += (n+1) * n / 2
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(countLetters("aaaba"))
        print(countLetters("aaaaaaaaaa"))
    }
}
