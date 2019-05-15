//
//  LongestPalindromicSubstring.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestPalindromicSubstringSolution {
    func longestPalindrome(_ s: String) -> String {
        let count = s.count
        if count < 2 {
            return s
        }
        
        var chars = Array(s)
        /* dp[i][j] : j <= index <= i */
        var dp: [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: count), count: count)
        var left = 0
        var right = 0
        for i in 0..<count {
            dp[i][i] = true
            var j = i - 1
            while j >= 0 {
                dp[i][j] = chars[i] == chars[j] && (i - j == 1 || dp[i - 1][j + 1])
                if dp[i][j] && i - j > right - left {
                    right = i
                    left = j
                }
                j -= 1
            }
        }
    
        let startIndex = s.index(s.startIndex, offsetBy: left)
        let endIndex = s.index(s.startIndex, offsetBy: right)
        let subString = String(s[startIndex...endIndex])
        return subString
    }
    
    func test() -> Void {
        print(longestPalindrome("babad"))
        print(longestPalindrome("cbbd"))
    }
}
