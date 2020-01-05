//
//  LongestPalindromicSubsequence.swift
//  leetcode
//
//  Created by mickyzhu on 2020/1/6.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class LongestPalindromicSubsequenceSolution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let chars = Array(s)
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: chars.count), count: chars.count)

        for i in (0..<chars.count).reversed() {
            dp[i][i] = 1
            for j in i+1..<chars.count {
                if chars[i] == chars[j] {
                    dp[i][j] = dp[i+1][j-1] + 2
                } else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j-1])
                }
            }
        }

        return dp[0][chars.count-1]
    }
    
    func test() -> Void {
        print(longestPalindromeSubseq("bbbab"))
        print(longestPalindromeSubseq("cbbd"))
    }
}
