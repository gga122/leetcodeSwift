//
//  PalindromicSubstrings.swift
//  leetcode
//
//  Created by Henry on 2020/1/15.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class PalindromicSubstringsSolution {
    func countSubstrings(_ s: String) -> Int {
        let count = s.count
        if count == 0 || count == 1 {
            return count
        }
        
        let chars = Array(s)
        /*
         dp[i][j] means count of palinramic substring in [i,j]
         dp[i][i] always is 1
         dp[i][j] = dp[i+1][j-1] + str[i] == str[j]
         */
        var res = 0
        var dp = [[Bool]].init(repeating: [Bool].init(repeating: false, count: count), count: count)
        for j in 0..<count {
            for i in (0...j).reversed() {
                if chars[i] == chars[j] && ((j-i<2) || dp[i+1][j-1]) {
                    dp[i][j] = true
                    res += 1
                }
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(countSubstrings("abc"))
        print(countSubstrings("aaa"))
    }
}
