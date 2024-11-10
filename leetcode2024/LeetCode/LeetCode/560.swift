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
        
        for pivot in 0..<nums.count {
            var total = 0
            
            for offset in pivot..<nums.count {
                total += nums[offset]
                if total == k {
                    count += 1
                }
            }
        }
        
        return count
    }
}
