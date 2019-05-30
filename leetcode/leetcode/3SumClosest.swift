//
//  3SumClosest.swift
//  leetcode
//
//  Created by Henry on 2019/5/31.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ThreeSumClosestSolution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums
        nums.sort()

        var closest = Int.max
        var dis = Int.max
        for i in 0..<nums.count {
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let v = nums[i] + nums[left] + nums[right]
                if dis > abs(target-v) {
                    dis = abs(target-v)
                    closest = v
                }
                
                if v < target {
                    left += 1
                } else if v > target {
                    right -= 1
                } else {
                    return target
                }
            }
        }
        
        return closest
    }
    
    func test() -> Void {
        print(threeSumClosest([-1,2,1,-4], 1))
        print(threeSumClosest([1,1,-1,-1,3], 3))
    }
}
