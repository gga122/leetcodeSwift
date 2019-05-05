//
//  RangeSumQuery-Immutable.swift
//  leetcode
//
//  Created by Henry on 2019/5/6.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RangeSumQuery_ImmutableNumArray {
    
    var sums: [Int]? = nil
    init(_ nums: [Int]) {
        sums = nums
        
        if nums.count == 0 {
            return
        }
        
        sums![0] = nums[0]
        var i = 1
        while i < nums.count {
            sums![i] = sums![i - 1] + nums[i]
            i += 1
        }
        
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if i == 0 {
            return sums![j]
        } else {
            return sums![j] - sums![i - 1]
        }
    }
    
    func test() -> Void {
        print(sumRange(0, 2))
        print(sumRange(2, 5))
        print(sumRange(0, 5))
    }
}


