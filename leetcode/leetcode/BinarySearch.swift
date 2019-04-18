//
//  BinarySearch.swift
//  leetcode
//
//  Created by Henry on 2019/4/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinarySearchSolution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1 
        
        while l <= r {
            let m = (l + r) / 2
            let v = nums[m]
            if v == target {
                return m
            } else if target < v {
                r = m - 1
            } else {
                l = m + 1
            }
        }
        
        return -1
    }
    
    func test() -> Void {
        print(search([-1, 0, 3, 5, 9, 12], 9))
        print(search([-1, 0, 3, 5, 9, 12], 2))
        print(search([-1, 0, 3, 5, 9, 12], 13))
    }
}
