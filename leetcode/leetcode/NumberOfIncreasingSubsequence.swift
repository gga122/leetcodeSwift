//
//  NumberOfIncreasingSubsequence.swift
//  leetcode
//
//  Created by Henry on 2019/5/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NumberOfIncreasingSubsequenceSolution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        var dp = Array<(len: Int, index: Int)>.init(repeating: (1, 1), count: nums.count)
        var maxValue = Int.min
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    if dp[j].len + 1 > dp[i].len {
                        dp[i] = (dp[j].len + 1, dp[j].index)
                    } else if dp[j].len + 1 == dp[i].len {
                        dp[i].index += dp[j].index
                    }
                }
            }
            maxValue = max(maxValue, dp[i].len)
        }
        
        var res = 0
        for i in 0..<nums.count {
            if dp[i].len == maxValue {
                res += dp[i].index
            }
        }
        return res
    }
    
    func test() -> Void {
        print(findNumberOfLIS([1,3,5,4,7]))
        print(findNumberOfLIS([2,2,2,2,2]))
    }
}
