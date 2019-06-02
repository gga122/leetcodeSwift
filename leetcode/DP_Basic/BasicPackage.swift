//
//  BasicPackage.swift
//  leetcode
//
//  Created by Henry on 2019/6/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BasicPackageSolution {
    func basicPackage(_ weights: [Int], _ values: [Int], _ capacity: Int) -> Int {
        /* dp[i][j]
           i表示背包的前i件物品
           j表示背包的承重
           dp[i][j]表示当前状态下放入背包的物品最大总价值
           dp[n][m]为最终结果, n=weights.count, m=capacity
           dp[0][0]表示空背包
         */
        let elementCount = weights.count
        
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: capacity+1), count: elementCount+1)
        for i in 0..<elementCount {
            for j in 1...capacity {
                let curWeight = weights[i]
                let curValue = values[i]
                if j >= curWeight {
                    dp[i+1][j] = max(dp[i][j], dp[i][j-curWeight] + curValue)
                } else {
                    dp[i+1][j] = dp[i][j]
                }
            }
        }

        print("dp: \(dp)")
        return dp[elementCount][capacity]
    }
    
    func test() -> Void {
        print(basicPackage([2,2,6,5,4], [6,3,5,4,6], 10))
    }
}
