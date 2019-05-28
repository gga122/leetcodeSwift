//
//  PermutationsII.swift
//  leetcode
//
//  Created by Henry on 2019/5/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PermutationsIISolution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }
        if nums.count == 1 {
            return [nums]
        }
        
        
        var ret = [[Int]]()
        var nums = nums
        nums.sort()
        backTracking(&ret, &nums, 0)
        
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ nums: inout [Int], _ sIndex: Int) -> Void {
        if sIndex == nums.count {
            result.append(nums)
        } else {
            for i in sIndex..<nums.count {
                var j = i - 1
                while j >= sIndex && nums[j] != nums[i] {
                    j -= 1
                }
                if j != sIndex - 1 {
                    continue
                }
                
                nums.swapAt(i, sIndex)
                backTracking(&result, &nums, sIndex+1)
                nums.swapAt(i, sIndex)
            }
        }
    }
    
    func test() -> Void {
        print(permuteUnique([1,1,2]))
        print(permuteUnique([2,2,1,1]))
    }
}
