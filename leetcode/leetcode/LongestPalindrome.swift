//
//  LongestPalindrome.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestPalindromeSolution {
    func longestPalindrome(_ s: String) -> Int {
        if s.count <= 1 {
            return s.count
        }
        
        var ret = 0
        var set = Set<Character>.init()
        for c in s {
            /* calculate paired count */
            if set.contains(c) {
                set.remove(c)
                ret += 1
            } else {
                set.insert(c)
            }
        }
        
        if set.isEmpty {
            return 2 * ret // all chars can be paired
        } else {
            return 2 * ret + 1 
        }
    }
    
    func test() -> Void {
        print(longestPalindrome("abccccdd"))
        print(longestPalindrome("ccc"))
        print(longestPalindrome("bananas"))
        print(longestPalindrome("ababababa"))
    }
}
