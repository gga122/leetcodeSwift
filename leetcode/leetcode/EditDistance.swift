//
//  EditDistance.swift
//  leetcode
//
//  Created by Henry on 2019/6/9.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class EditDistanceSolution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let chars1 = Array(word1)
        let chars2 = Array(word2)
        
        if chars1.count * chars2.count == 0 {
            return chars1.count + chars2.count
        }
        
        var dp = [[Int]].init(repeating: .init(repeating: 0, count: chars2.count+1), count: chars1.count+1)
        for i in 0..<dp.count {
            dp[i][0] = i
        }
        for j in 0..<dp[0].count {
            dp[0][j] = j
        }
        
        for i in 1..<dp.count {
            for j in 1..<dp[i].count {
                let left = dp[i-1][j] + 1
                let down = dp[i][j-1] + 1
                var leftDown = dp[i-1][j-1]
                if chars1[i-1] != chars2[j-1] {
                    leftDown += 1
                }
                dp[i][j] = min(left, down, leftDown)
            }
        }
        
        return dp[chars1.count][chars2.count]
    }
    
    func test() -> Void {
        print(minDistance("horse", "ros"))
        print(minDistance("intention", "execution"))
    }
}
