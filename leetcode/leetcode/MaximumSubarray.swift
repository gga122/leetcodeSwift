//
//  MaximumSubarray.swift
//  leetcode
//
//  Created by Henry on 2019/4/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximumSubarraySolution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums.first!
        }
        
        var nums = nums
        var i = 1
        while i < nums.count {
            nums[i] = nums[i] + max(nums[i - 1], 0)
            i += 1
        }

        return nums.max()!
    }
    
    func test() -> Void {
        print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
    }
}
