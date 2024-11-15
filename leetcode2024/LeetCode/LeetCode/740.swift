//
//  740.swift
//  LeetCode
//
//  Created by henry on 2024/11/14.
//

import Foundation

class Solution_740 {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        /*
         先打表, 减少循环次数
         */
        var map = [Int: Int]()
        for num in nums {
            let count = map[num] ?? 1
            map[num] = count
        }
        
        var maxEarn = 0
        for num in map.keys {
            let target1 = num-1
            let allTarget1 = (map[target1] ?? 0) * target1
            
            let target2 = num+1
            let allTarget2 = (map[target2] ?? 0) * target2
            
            let curMax = allTarget1 + num + allTarget2
            maxEarn = max(maxEarn, curMax)
        }
        
        return maxEarn
    }
}
