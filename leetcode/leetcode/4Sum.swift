//
//  4Sum.swift
//  leetcode
//
//  Created by Henry on 2019/6/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FourSumSolution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {
            return []
        }
        var nums = nums
        nums.sort()
        
        var ret = [[Int]]()
        var i = 0
        while i < nums.count-3 {
            let val3 = target - nums[i]
            var j = i+1
            while j < nums.count-2 {
                let val2 = val3 - nums[j]
                var start = j + 1
                var end = nums.count - 1
                while start < end {
                    let v = nums[start] + nums[end]
                    if v == val2 {
                        let co = [nums[i], nums[j], nums[start], nums[end]]
                        ret.append(co)
                        
                        while start < end && nums[start] == nums[start+1] {
                            start += 1
                        }
                        while start < end && nums[end] == nums[end-1] {
                            end -= 1
                        }
                        start += 1
                        end -= 1
                    } else if v > val2 {
                        end -= 1
                    } else {
                        start += 1
                    }
                }
                while j + 1 < nums.count-2 && nums[j] == nums[j+1] {
                    j += 1
                }
                j += 1
            }
            while i + 1 < nums.count-3 && nums[i] == nums[i+1] {
                i += 1
            }
            i += 1
        }

        return ret
    }
    
    func test() -> Void {
        print(fourSum([1, 0, -1, 0, -2, 2], 0))
        print(fourSum([-3,-2,-1,0,0,1,2,3], 0))
        print(fourSum([0,0,0,0], 0))
    }
}
