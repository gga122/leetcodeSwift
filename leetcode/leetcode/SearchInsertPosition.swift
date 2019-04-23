//
//  SearchInsertPosition.swift
//  leetcode
//
//  Created by Henry on 2019/4/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SearchInsertPositionSolution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        if target <= nums.first! {
            return 0
        }
        
        if target > nums.last! {
            return nums.count
        }
        
        var l = 0
        var r = nums.count
        while l < r {
            let index = l + (r - l) / 2
            let v = nums[index]
            if v > target {
                r = index
            } else if v < target {
                l = index + 1
            } else {
                return index
            }
        }
        
        return l
    }
    
    func test() -> Void {
        print(searchInsert([1, 3, 5, 6], 5))
        print(searchInsert([1, 3, 5, 6], 2))
        print(searchInsert([1, 3, 5, 6], 7))
        print(searchInsert([1, 3, 5, 6], 0))
        print(searchInsert([1], 1))
        print(searchInsert([1, 3, 4, 5, 6, 8, 10], 5))
        print(searchInsert([1, 3, 5], 4))
    }
}
