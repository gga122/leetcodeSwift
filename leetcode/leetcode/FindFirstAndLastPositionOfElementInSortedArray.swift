//
//  FindFirstAndLastPositionOfElementInSortedArray.swift
//  leetcode
//
//  Created by Henry on 2019/6/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindFirstAndLastPositionOfElementInSortedArraySolution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 {
            return [-1,-1]
        }
        
        var ret = [-1,-1]
        ret[0] = helper(nums, target, 0, nums.count-1, true)
        ret[1] = helper(nums, target, 0, nums.count-1, false)
        return ret
    }
    
    func helper(_ nums: [Int], _ target: Int, _ begin: Int, _ end: Int, _ left: Bool) -> Int {
        if begin > end || target < nums[begin] || target > nums[end] {
            return -1
        }
        
        var ret = -1
        var begin = begin
        var end = end
        while begin <= end {
            let mid = (end - begin) / 2 + begin
            let midValue = nums[mid]
            if midValue > target {
                end = mid - 1
            } else if midValue < target {
                begin = mid + 1
            } else {
                if left {
                    let minIndex = helper(nums, target, begin, mid-1, left)
                    ret = (minIndex == -1 ? mid : min(minIndex, mid))
                    break
                } else {
                    let maxIndex = helper(nums, target, mid+1, end, left)
                    ret = (maxIndex == -1 ? mid: max(maxIndex, mid))
                    break
                }
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(searchRange([5,7,7,8,8,10], 8))
        print(searchRange([5,7,7,8,8,10], 6))
    }
}
