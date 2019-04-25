//
//  MajorityElement.swift
//  leetcode
//
//  Created by Henry on 2019/4/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MajorityElementSolution {
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums.first!
        }
        
        var index = 1
        var ret = nums[0]
        var count = 1
        while index < nums.count {
            if nums[index] == ret {
                count += 1
            } else {
                count -= 1
                
                if count == 0 {
                    ret = nums[index + 1]
                }
            }
            
            index += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(majorityElement([3, 2, 3]))
        print(majorityElement([2, 2, 1, 1, 1, 2, 2]))
    }
}
