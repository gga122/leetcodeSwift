//
//  MinimumSizeSubarraySum.swift
//  leetcode
//
//  Created by Henry on 2019/6/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinimumSizeSubarraySumSolution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 && nums[0] == s {
            return 1
        }
        
        var minLength = Int.max
        var base = 0
        var start = 0
        var sum = 0
        while base < nums.count {
            if sum + nums[base] < s {
                sum += nums[base]
                base += 1
            } else {
                minLength = min(minLength, base-start+1)
                sum -= nums[start]
                start += 1
            }
        }
        
        return minLength == Int.max ? 0 : minLength
    }
    
    func test() -> Void {
        print(minSubArrayLen(7, [2,3,1,2,4,3]))
        print(minSubArrayLen(11, [1,2,3,4,5]))
    }
}
