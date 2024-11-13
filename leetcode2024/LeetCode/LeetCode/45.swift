//
//  45.swift
//  LeetCode
//
//  Created by henry on 2024/11/11.
//

import Foundation

class Solution_45 {
    
    func jump(_ nums: [Int]) -> Int {
        /**
         找到每个index的最远触达即可得到全局最优解
         与55题类似, 额外需要记录当前的步数而已
         */
        var maxRight = 0
        var steps = 0
        var end = 0
        /**
         这里我们不能访问最后一个元素, 因为在访问最后一个元素的时候, 边界 end 一定会大于等于最后一个 index.
         这会导致我们多计算一次步数, 因为题意本身已经说明一定可以触达
         */
        for index in 0..<nums.count-1 {
            /**
             1. 因为题目保证了一定可以跳到 nums[n-1] 处, 故我们不需要判断 `index <= maxRight`
             2. 每次遍历到边界的时候, 我们更新边界到最右位置
             */
            maxRight = max(maxRight, index+nums[index])
            if index == end {
                end = maxRight
                steps += 1
            }
            
        }
        
        return steps
    }
    
}
