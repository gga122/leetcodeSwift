//
//  FindPeakElement.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindPeakElementSolution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        while l < r {
            let mid = (l + r) / 2
            if nums[mid] > nums[mid + 1] {
                r = mid
            } else {
                l = mid + 1
            }
        }
        
        return l
    }
    
    func search(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        if l == r {
            return l
        }
        
        let mid = (l + r) / 2
        if nums[mid] > nums[mid+1] {
            return search(nums, l, mid)
        } else {
            return search(nums, mid+1, r)
        }
    }
    
    func test() -> Void {
        print(findPeakElement([2,1,2]))
        print(findPeakElement([3,2,1]))
        print(findPeakElement([1]))
        print(findPeakElement([1,3]))
        print(findPeakElement([1,2,3,1]))
        print(findPeakElement([1,2,1,3,5,6,4]))
    }
}
