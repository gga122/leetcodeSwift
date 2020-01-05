//
//  MinimumInsertionStepsToMakeAStringPalindrome.swift
//  leetcode
//
//  Created by mickyzhu on 2020/1/5.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MinimumInsertionStepsToMakeAStringPalindromeSolution {
    func minInsertions(_ s: String) -> Int {
        let chars = Array(s)
        
        /*
         dp[i][j] -> [i, j]构建回文时需要插入的最小操作次数
         dp[i][i] 一直为0, 因为单个字母永远是回文串
         如果 chars[i] == chars[j] 那么 dp[i][j] = dp[i+1][j-1]
         如果 chars[i] != chars[j] 那么 dp[i][j] = min(dp[i+1][j], dp[i][j-1]) + 1
         */
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: chars.count), count: chars.count)
        for i in (0..<chars.count).reversed() {
            for j in i+1..<chars.count {
                if chars[i] == chars[j] {
                    dp[i][j] = dp[i+1][j-1]
                } else {
                    dp[i][j] = min(dp[i+1][j], dp[i][j-1]) + 1
                }
            }
        }
        
        return dp[0][chars.count - 1]
    }
    
    func test() -> Void {
        print(minInsertions("zzazz"))
        print(minInsertions("mbadm"))
        print(minInsertions("leetcode"))
        print(minInsertions("g"))
        print(minInsertions("no"))
        print(minInsertions("zjveiiwvc")) // zcjvweiiewvjcz
    }
}
