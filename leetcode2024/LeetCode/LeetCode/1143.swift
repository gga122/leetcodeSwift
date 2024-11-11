//
//  1143.swift
//  LeetCode
//
//  Created by henry on 2024/11/11.
//

import Foundation

class Solution_1143 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        /**
         二维动态规划题
         假定 text1 长度为 m, text2 长度为 n, 则可以设定 dp[m][n] 用于记录状态, dp[i][j] 表示 text1[0...i] 和 text2[0...j] 的最长公共子序列长度
         
         1. 当 i=0 / j=0, dp[i][j] = 0 (显而易见, 因为其中一个是空字符串)
         2. 当 text1[i-1] = text2[j-1], dp[i][j] = dp[i-1][j-1] + 1
         3. 当 text1[i-1] != text2[j-1], dp[i][j] = max(dp[i-1][j], dp[i][j-1])
         */
        let chars1 = Array(text1)
        let chars2 = Array(text2)
        
        let m = chars1.count
        let n = chars2.count
        
        var dp = [[Int]].init(repeating: .init(repeating: 0, count: n+1), count: m+1)
        for i in 1...m {
            let c1 = chars1[i-1]
            for j in 1...n {
                let c2 = chars2[j-1]
                if c1 == c2 {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return dp[m][n]
    }
}
