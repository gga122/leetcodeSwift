//
//  MajorityElementII.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MajorityElementIISolution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        
        var count1 = 0
        var num1 = nums[0]
        var count2 = 0
        var num2 = nums[0]
        for num in nums {
            if num == num1 {
                count1 += 1
            } else if num == num2 {
                count2 += 1
            } else if count1 == 0 {
                count1 = 1
                num1 = num
            } else if count2 == 0 {
                count2 = 1
                num2 = num
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        
        count1 = 0
        count2 = 0
        for num in nums {
            if num == num1 {
                count1 += 1
            } else if num == num2 {
                count2 += 1
            }
        }
        
        var result = [Int]()
        if count1 > nums.count/3 {
            result.append(num1)
        }
        if num1 != num2 && count2 > nums.count/3 {
            result.append(num2)
        }
        
        return result
    }
    
    func test() -> Void {
        print(majorityElement([3,2,3]))
        print(majorityElement([1,1,1,3,3,2,2,2]))
    }
}
