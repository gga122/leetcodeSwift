//
//  LongestIncreasingSubsequence.swift
//  leetcode
//
//  Created by Henry on 2019/5/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestIncreasingSubsequenceSolution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        var nums = nums
        while nums.count >= 2 && nums[0] >= nums[1] {
            nums.removeFirst()
        }
        while nums.count >= 2 && nums[nums.count-1] <= nums[nums.count-2] {
            nums.removeLast()
        }
        
        var dp = [Int].init(repeating: 1, count: nums.count)
        /* f(i) = 1 + max(f(j) if nums[i] > nums[j]) (j < i) */
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        var maxValue = Int.min
        for v in dp {
            maxValue = max(maxValue, v)
        }
        
        return maxValue
    }
    
    func test() -> Void {
        print(lengthOfLIS([10,9,2,5,3,7,101,18]))
        print(lengthOfLIS([1,3,6,7,9,4,10,5,6]))
    }
}
