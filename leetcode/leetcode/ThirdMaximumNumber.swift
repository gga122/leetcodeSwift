//
//  ThirdMaximumNumber.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ThirdMaximumNumberSolution {
    func thirdMax(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        var result = [Int].init(repeating: Int.min, count: 3)
        for num in nums {
            if num == result[0] || num == result[1] || num == result[2] {
                continue
            }
            
            if num > result[0] {
                result[2] = result[1]
                result[1] = result[0]
                result[0] = num
            } else if num > result[1] {
                result[2] = result[1]
                result[1] = num
            } else if num > result[2] {
                result[2] = num
            }
        }

        if result[2] != Int.min {
            return result[2]
        }
        return result[0]
    }
    
    func test() -> Void {
        print(thirdMax([3,2,1]))
        print(thirdMax([1,2]))
        print(thirdMax([2,2,3,1]))
    }
}
