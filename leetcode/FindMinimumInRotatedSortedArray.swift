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
        /* If nums is ascend array, just return the first one. */
        if nums.first! < nums.last! {
            return nums.first!
        }
    
        var start = 0
        var end = nums.count - 1
        while start < end {
            let mid = (end - start) / 2 + start;
            if nums[start] < nums[mid] {
                /* [start, mid] is ascend, skip it. */
                start = mid + 1
            } else {
                /* [mid, end] is ascend, skip it. */
                if nums[mid] < nums[end] {
                    end = mid - 1
                } else {
                    /* find the point */
                    if nums[mid] > nums[mid+1] {
                        return nums[mid+1]
                    }
                }
            }
        }
        
        return nums[start]
    }
    
    func test() -> Void {
        print(findMin([3,4,5,1,2]))
        print(findMin([4,5,6,7,0,1,2]))
    }
}
