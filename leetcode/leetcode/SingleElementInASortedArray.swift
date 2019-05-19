//
//  SingleElementInASortedArray.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SingleElementInASortedArraySolution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        var start = 0
        var end = nums.count - 1
        while start < end {
            let mid = (end - start) / 2 + start
            /* Left length == Right length */
            if mid % 2 == 0 {
                if nums[mid] == nums[mid - 1] {
                    end = mid
                } else {
                    start = mid
                }
            } else {
                if nums[mid] == nums[mid - 1] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }
        
        return nums[start];
    }
    
    func test() -> Void {
        print(singleNonDuplicate([1,1,2,3,3,4,4,8,8]))
        print(singleNonDuplicate([3,3,7,7,10,11,11]))
        print(singleNonDuplicate([1,1,2,3,3]))
    }
}
