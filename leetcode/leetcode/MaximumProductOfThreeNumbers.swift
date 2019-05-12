//
//  MaximumProductOfThreeNumbers.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximumProductOfThreeNumbersSolution {
    func maximumProduct(_ nums: [Int]) -> Int {
        if nums.count == 3 {
            return nums[0] * nums[1] * nums[2]
        }
        
        var Max = (Int.min, Int.min, Int.min) // MAX.0 > MAX.1 > MAX.2
        var Min = (Int.max, Int.max) // MIN.0 > MIN.1
        for n in nums {
            if n > Max.0 {
                Max.2 = Max.1
                Max.1 = Max.0
                Max.0 = n
            } else if (n > Max.1) {
                Max.2 = Max.1
                Max.1 = n
            } else if (n > Max.2) {
                Max.2 = n
            }
            
            if n < Min.1 {
                Min.0 = Min.1
                Min.1 = n
            } else if n < Min.0 {
                Min.0 = n
            }
        }
        
        return max(Max.0 * Max.1 * Max.2, Max.0 * Min.0 * Min.1)
    }
    
    func test() -> Void {
        print(maximumProduct([1, 2, 3]))
        print(maximumProduct([1, 2, 3, 4]))
        print(maximumProduct([-4, -3, -2, -1, 60]))
    }
}
