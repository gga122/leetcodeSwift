//
//  FindMinimumInRotatedSortedArray.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindMinimumInRotatedSortedArraySolution {
    func findMin(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return Int.max
        }
        if nums.count == 1 {
            return nums.first!
        }
        
        if nums.count == 2 {
            return min(nums[0], nums[1])
        }
        
        let mid = nums.count / 2;
        let left = findMin(Array(nums[0...mid]))
        let right = findMin(Array(nums[mid+1...nums.count-1]))
        
        return min(left, right)
    }
    
    func test() -> Void {
        print(findMin([3,4,5,1,2]))
        print(findMin([4,5,6,7,0,1,2]))
    }
}
