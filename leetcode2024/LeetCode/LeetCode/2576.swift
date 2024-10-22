//
//  2576.swift
//  LeetCode
//
//  Created by henry on 2024/9/19.
//

import Foundation

class Solution_2576 {
    func maxNumOfMarkedIndices(_ nums: [Int]) -> Int {
        guard nums.count >= 2 else { return 0 }
        
        let sorted = nums.sorted()
        guard 2 * sorted.first! <= sorted.last! else { return 0 }
        
        return 0
    }
}
