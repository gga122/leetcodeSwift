//
//  RotateArray.swift
//  leetcode
//
//  Created by Henry on 2019/4/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RotateArraySolution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k == 0 {
            return
        }
        
        let count = nums.count
        let k = k % count
        reverse(&nums, 0, count - 1 - k)
        reverse(&nums, count - k, count - 1)
        reverse(&nums, 0, count - 1)
    }
    
    func reverse(_ nums: inout [Int], _ startIndex: Int, _ endIndex: Int) -> Void {
        var startIndex = startIndex
        var endIndex = endIndex
        while endIndex > startIndex {
            let temp = nums[endIndex]
            nums[endIndex] = nums[startIndex]
            nums[startIndex] = temp
            
            startIndex += 1
            endIndex -= 1
        }
    }
    
    func test() -> Void {
        var array1 = [1, 2, 3, 4, 5, 6, 7]
        rotate(&array1, 3)
        print(array1)
        var array2 = [-1, -100, 3, 99]
        rotate(&array2, 2)
        print(array2)
    }
}
