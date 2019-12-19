//
//  SearchInRotatedSortedArrayII.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SearchInRotatedSortedArrayIISolution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        if nums.count == 0 {
            return false
        }
        if nums.count == 1 {
            return nums.first == target
        }
        
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = (end - start) / 2 + start
            if nums[mid] == target {
                return true
            }
            
            /* [start, mid] is ascend order */
            if nums[start] < nums[mid] {
                if nums[start] == target {
                    return true
                } else if nums[start] < target && nums[mid] > target {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else {
                if nums[start] == target {
                    return true
                }
                /* Try in [start+1, end] */
                start += 1
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(search([2,5,6,0,0,1,2], 0))
        print(search([2,5,6,0,0,1,2], 3))
        print(search([3,1,1], 3))
    }
}
