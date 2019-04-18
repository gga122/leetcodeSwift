//
//  ArrayPartition.swift
//  leetcode
//
//  Created by Henry on 2019/4/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ArrayPartitionSolution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 1 {
            return nums.first!
        }
        
        var nums = nums
        nums.sort()
        var idx = 0
        var result = 0
        repeat {
            result += nums[idx]
            idx += 2
        } while idx < count
        
        return result
    }
    
    func testArrayPairSum() -> Void {
        print(arrayPairSum([1, 2, 3, 4]))
    }
}
