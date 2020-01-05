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

        /*
         dp[i][j] -> [i, j]的最大子序列长度
         chars[i] == chars[j] 那么 dp[i][j] = dp[i+1][j-1] + 2 (前一个最大长度状态 + 2)
         chars[i] != chars[j] 那么 dp[i][j] = max(dp[i+1][j], dp[i][j-1]) (右边子序列最大长度状态, 左边子序列最大长度状态)
         dp[i][i] = 1 自身最大长度一直是1
         */
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
