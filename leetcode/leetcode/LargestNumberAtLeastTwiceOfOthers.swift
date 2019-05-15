//
//  LargestNumberAtLeastTwiceOfOthers.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LargestNumberAtLeastTwiceOfOthersSolution {
    func dominantIndex(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return -1
        }
        if nums.count == 1 {
            return 0
        }
        
        var index = 0
        for i in 1..<nums.count {
            if nums[i] > nums[index] {
                index = i
            }
        }
        let max = nums[index]
        for i in 0..<nums.count {
            if i == index {
                continue
            }
            
            if nums[i] * 2 > max {
                return -1
            }
        }
        
        return index
    }
    
    func test() -> Void {
        print(dominantIndex([3, 6, 1, 0]))
        print(dominantIndex([1, 2, 3, 4]))
    }
}
