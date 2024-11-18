//
//  3354.swift
//  LeetCode
//
//  Created by henry on 2024/11/18.
//

import Foundation

class Solution_3354 {
    func countValidSelections(_ nums: [Int]) -> Int {
        /**
         最暴力的方法肯定是一步步模拟, 但是我们可以重点分析下题意
         
         1. 从值等于0的下标开始
         2. 可以往左或者往右移动
         3. 移动过程中碰到的0都可以忽略, 碰到不等于0的值, 则减1然后调转方向移动
         4. 如果超出数组范围, 则结束
         5. 终止后对数组进行判别, 如果所有元素都为0则有效
         
         整个流程类似于打左右打砖块, 如果起始位置要有效, 则进行讨论
         1. 如果起始位置左边求和等于右边求和, 则第一步向右或者向左都可以
         2. 如果起始位置左边求和与右边求和相差1, 则第一步先向和更大的方向移动
         3. 如果起始位置左边求和与右边求和相差超过1, 则无论向左还有向右都无效
         */
        var count = 0
        let zeroIndexes = nums.enumerated().compactMap { $0.element == 0 ? $0.offset : nil }
        for index in zeroIndexes {
            let left = nums[0..<index].reduce(0, +)
            let right = nums[index+1..<nums.count].reduce(0, +)
            if left == right {
                count += 2
            } else if abs(left - right) == 1 {
                count += 1
            }
        }
        
        return count
    }
}
