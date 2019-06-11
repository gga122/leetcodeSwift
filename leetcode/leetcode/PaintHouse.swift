//
//  PaintHouse.swift
//  leetcode
//
//  Created by Henry on 2019/6/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PaintHouseSolution {
    func minCost(_ costs: [[Int]]) -> Int {
        if costs.count == 0 {
            return 0
        }
        
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: 3), count: costs.count)
        dp[0] = costs[0]
        for i in 1..<costs.count {
            let cost = costs[i]
            dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + cost[0]
            dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + cost[1]
            dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + cost[2]
        }
        
        let last = dp.last!
        let minValue = min(last[0], last[1], last[2])
        
        return minValue
    }
    
    func test() -> Void {
        print(minCost([[17,2,17],[16,16,5],[14,3,19]]))
    }
}
