//
//  560.swift
//  LeetCode
//
//  Created by henry on 2024/11/8.
//

import Foundation

class Solution_560 {
    
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        
        /* 暴力解法
        for pivot in 0..<nums.count {
            var total = 0
            
            for offset in pivot..<nums.count {
                total += nums[offset]
                if total == k {
                    count += 1
                }
            }
        }
         */
        
        /**
         考虑用哈希表缓存前缀和计算结果
         假定 pre[i] 为 [0..i] 的所有数之和, 则 pre[i] = pre[i-1] + nums[i]
         同理 [i..j] 子数组求和可转化为 pre[j] - pre[i-1] = k
         
         
         */
        var cache = [Int: Int]()
        
        
        return count
    }
}
