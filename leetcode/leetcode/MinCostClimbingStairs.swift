//
//  MinCostClimbingStairs.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinCostClimbingStairsSolution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let count = cost.count
        if count < 2 {
            return 0
        }
        if count == 2 {
            return min(cost[0], cost[1])
        }
        
        var cost = cost
        for i in 2..<cost.count {
            cost[i] += min(cost[i - 1], cost[i - 2])
        }
        
        return min(cost[count - 2], cost[count - 1])
    }
    
    func test() -> Void {
        print(minCostClimbingStairs([10, 15, 20]))
        print(minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]))
    }
}
