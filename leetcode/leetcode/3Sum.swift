//
//  3Sum.swift
//  leetcode
//
//  Created by Henry on 2019/5/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ThreeSumSolution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count <= 2 {
            return []
        }
        if nums.count == 3 {
            return nums.reduce(0, +) == 0 ? [nums] : []
        }
        
        let nums = nums.sorted()
        var ret = [[Int]]()
        for i in 0..<nums.count {
            /* skip the same values because we handle it before */
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let cur = nums[i] + nums[left] + nums[right]
                if cur == 0 {
                    ret.append([nums[i], nums[left], nums[right]])
                    
                    /* skip same values equal to left when shift to left */
                    while left < right && nums[left] == nums[left+1] {
                        left += 1
                    }
                    /* skip same values equal to right when shift to right */
                    while left < right && nums[right] == nums[right-1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if cur > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(threeSum([-1,0,1,2,-1,-4]))
        print(threeSum([0,0,0,0]))
        print(threeSum([-1,0,1,0]))
    }
}
