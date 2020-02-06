//
//  CheckIfANumberIsMajorityElementInASortedArray.swift
//  leetcode
//
//  Created by MickyZhu on 6/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class CheckIfANumberIsMajorityElementInASortedArraySolution {
    func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
        let threshold = nums.count / 2
        var count = 0
        for n in nums {
            if n == target {
                count += 1
                
                if count > threshold {
                    return true
                }
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(isMajorityElement([2,4,5,5,5,5,5,6,6], 5))
        print(isMajorityElement([10,100,101,101], 101))
    }
}
