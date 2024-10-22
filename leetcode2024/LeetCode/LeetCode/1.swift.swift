//
//  1.swift.swift
//  LeetCode
//
//  Created by henry on 2024/10/22.
//

import Foundation

class Solution_1 {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        
        for index in 0..<nums.count {
            let remain = target - nums[index]
            if let tarIndex = map[remain] {
                return [tarIndex, index]
            } else {
                map[nums[index]] = index
            }
        }
        
        return []
    }
    
}
