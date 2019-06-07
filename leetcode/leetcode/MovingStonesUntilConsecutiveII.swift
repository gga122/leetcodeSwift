//
//  MovingStonesUntilConsecutiveII.swift
//  leetcode
//
//  Created by Henry on 2019/6/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation


class MovingStonesUntilConsecutiveIISolution {
    func numMovesStonesII(_ stones: [Int]) -> [Int] {
        if stones.count <= 2 {
            return [0,0]
        }
        
        /* Make stones ascending */
        var stones = stones
        stones.sort()
        let n = stones.count
        var maxValue = stones[n-1] - stones[0] + 1 - n
        maxValue -= min(stones[n-1]-stones[n-2]-1, stones[1]-stones[0]-1)
        var minValue = maxValue
        var i = 0
        var j = 0
        while i < n {
            while j+1 < n && stones[j+1] - stones[i] + 1 <= n {
                j += 1
            }
            var cost = n - (j-i+1)
            if j-i+1 == n-1 && stones[j] - stones[i] + 1 == n-1 {
                cost = 2
            }
            minValue = min(minValue, cost)
            i += 1
        }
        
        return [minValue, maxValue]
    }
    
    func test() -> Void {
        print(numMovesStonesII([7,4,9]))
        print(numMovesStonesII([6,5,4,3,10]))
        print(numMovesStonesII([100,101,104,102,103]))
    }
}
