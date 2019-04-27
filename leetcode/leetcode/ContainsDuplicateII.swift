//
//  ContainsDuplicateII.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ContainsDuplicateIISolution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var d = Dictionary<Int, Int>.init()
        
        var index = 0
        while index < nums.count {
            let n = nums[index]
            let existedIndex = d[n]
            if existedIndex == nil {
                d[n] = index
            } else {
                if abs(existedIndex! - index) <= k {
                    return true
                } else {
                    d[n] = index
                }
            }
            index += 1
        }
        
        return false
    }
    
    func test() -> Void {
        print(containsNearbyDuplicate([1, 2, 3, 1], 3))
        print(containsNearbyDuplicate([1, 0, 1, 1], 1))
        print(containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2))
    }
}
