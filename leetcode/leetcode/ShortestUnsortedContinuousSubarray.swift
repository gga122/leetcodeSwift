//
//  ShortestUnsortedContinuousSubarray.swift
//  leetcode
//
//  Created by Henry on 2020/1/15.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ShortestUnsortedContinuousSubarraySolution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        if nums.count == 0 || nums.count == 1 {
            return 0
        }
        
        /* Assume the whole array need to sort */
        var minVal = nums.last!
        var maxVal = nums.first!
        var l = 0
        var r = -1
        for i in 0..<nums.count {
            if maxVal > nums[i] {
                r = i
            } else {
                maxVal = nums[i]
            }
            
            if minVal < nums[nums.count-i-1] {
                l = nums.count-i-1
            } else {
                minVal = nums[nums.count-i-1]
            }
        }
        
        return r-l+1
    }
    
    func test() -> Void {
        print(findUnsortedSubarray([2, 6, 4, 8, 10, 9, 15]))
        print(findUnsortedSubarray([1,2,3,4]))
    }
}
