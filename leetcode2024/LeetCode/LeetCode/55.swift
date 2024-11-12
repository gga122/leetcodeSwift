//
//  55.swift
//  LeetCode
//
//  Created by henry on 2024/11/11.
//

import Foundation

class Solution_55 {
    func canJump(_ nums: [Int]) -> Bool {
        /**
         记录当前 index 之前的子数组最大能跳的长度
         
         dp[0] = nums[0]
         dp[1] = max(dp[0], 1 + nums[1])
         dp[2] = max(dp[1], 2 + nums[2])
         dp[i] = max(dp[i-1], i + nums[i])
         */
        var maxRight = 0
        for index in 0..<nums.count {
            /*
             这里要判断index是否在最右边界内, 越界的元素直接跳过
             */
            if index <= maxRight {
                maxRight = max(maxRight, index+nums[index])
                if maxRight >= nums.count-1 {
                    return true
                }
            }
        }
        
        return false
    }
}
