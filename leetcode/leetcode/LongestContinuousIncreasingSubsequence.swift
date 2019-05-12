//
//  LongestContinuousIncreasingSubsequence.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestContinuousIncreasingSubsequenceSolution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        if nums.count == 2 {
            return (nums[0] < nums[1] ? 2 : 1)
        }
        
        var maxCount = 1
        var previous = nums[0]
        var count = 1
        for i in 1..<nums.count {
            let num = nums[i]
            if num > previous {
                count += 1
            } else {
                maxCount = max(maxCount, count)
                count = 1
            }
            previous = num
        }
        maxCount = max(maxCount, count)
        
        return maxCount
    }
    
    func test() -> Void {
        print(findLengthOfLCIS([1,3,5,4,7]))
        print(findLengthOfLCIS([2,2,2,2,2]))
        print(findLengthOfLCIS([1,3,5,7]))
    }
}
