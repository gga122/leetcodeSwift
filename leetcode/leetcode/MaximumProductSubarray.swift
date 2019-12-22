//
//  MaximumProductSubarray.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximumProductSubarraySolution {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        var maxVal = Int.min
        var imax = 1
        var imin = 1
        for num in nums {
            if num < 0 {
                swap(&imax, &imin)
            }
            imax = max(imax*num, num)
            imin = min(imin*num, num)
            
            maxVal = max(maxVal, imax)
        }
        
        return maxVal
    }
    
    func test() -> Void {
        print(maxProduct([2,3,-2,4]))
        print(maxProduct([-2,0,-1]))
    }
}
