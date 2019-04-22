//
//  RemoveDuplicatesFromSortedArray.swift
//  leetcode
//
//  Created by Henry on 2019/4/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RemoveDuplicatesFromSortedArraySolution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        var current = nums[0]
        var index = 1
        while index < nums.count {
            if nums[index] == current {
                nums.remove(at: index)
            } else {
                current = nums[index]
                index += 1
            }
        }
        
        return nums.count
    }
    
    func test() -> Void {
        var array1 = [1, 1, 2]
        print(removeDuplicates(&array1))
        var array2 = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
        print(removeDuplicates(&array2))
    }
}
