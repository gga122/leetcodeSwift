//
//  SearchInRotatedSortedArray.swift
//  leetcode
//
//  Created by Henry on 2019/5/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SearchInRotatedSortedArraySolution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }
        
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = (end - start) / 2 + start
            if nums[mid] == target {
                return mid
            }
            
            /* [start, mid] is ascend order */
            if nums[start] < nums[mid] {
                if nums[start] == target {
                    return start
                } else if nums[start] < target && nums[mid] > target {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else {
                /* [mid, end] is ascend order */
                if nums[mid] < nums[end] {
                    if nums[end] == target {
                        return end
                    } else if nums[mid] < target && target < nums[end] {
                        start = mid + 1
                    } else {
                        end = mid - 1
                    }
                } else {
                    /* whole nums is descend order */
                    if target > nums[mid] {
                        end = mid - 1
                    } else {
                        start = mid + 1
                    }
                }
            }
        }
        
        return -1
    }
    
    func test() -> Void {
        print(search([4,5,6,7,0,1,2], 0))
        print(search([4,5,6,7,0,1,2], 3))
        print(search([3,1], 1))
    }
}
