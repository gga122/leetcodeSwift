//
//  2239.swift
//  LeetCode
//
//  Created by henry on 2024/11/17.
//

import Foundation

class Solution_2239 {
    func findClosestNumber(_ nums: [Int]) -> Int {
        /**
         distance 记录最小距离, 选择 Int.max 便于处理逻辑, 因为 distance 一定比 Int.max 小
         result 记录最佳结果, 选择 Int.min 便于处理逻辑, 因为 result 一定比 Int.min 大
         */
        var distance = Int.max
        var result = Int.min
        
        for num in nums {
            let absVal = abs(num)
            if absVal < distance {
                result = num
                distance = absVal
            } else if absVal == distance {
                result = max(num, result)
            }
        }
        
        return result
    }
}
