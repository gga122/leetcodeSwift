//
//  128.swift
//  LeetCode
//
//  Created by henry on 2024/11/11.
//

import Foundation

class Solution_128 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        /*
         类似这种对时间复杂度存在要求的问题, 一般都会用到哈希表这种数据结构
         */
        var maxLength = 0
        
        /**
         先去除重复的元素
         时间复杂度O(n)
         */
        var sets = Set<Int>.init(nums)
        let nums = Array(sets)
        
        /**
         遍历去重后的数据, 如果当前元素有前导元素, 则说明当前元素在某个连续序列中, 直接跳过
         */
        for num in nums {
            let previousNum = num-1
            if sets.contains(previousNum) {
                continue
            } else {
                /*
                 从当前元素逐步判断是否存在下一个连续元素, 如果不存在则跳出循环
                 */
                var length = 1
                var nextNum = num+1
                while sets.contains(nextNum) {
                    length += 1
                    nextNum += 1
                }
                
                maxLength = max(maxLength, length)
            }
        }
        
        
        return maxLength
    }
}
