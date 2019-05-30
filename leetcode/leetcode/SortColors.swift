//
//  SortColors.swift
//  leetcode
//
//  Created by Henry on 2019/5/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SortColorsSolution {
    func sortColors(_ nums: inout [Int]) {
        var skipCount = 0
        for i in 0..<nums.count {
            if i != 0 && nums[i] == 0 {
                nums.insert(nums.remove(at: i), at: 0)
                skipCount += 1
            }
        }
        for i in (skipCount..<nums.count).reversed() {
            if nums[i] == 2 {
                nums.append(nums.remove(at: i))
            }
        }
    }
    
    func test() -> Void {
        var colors = [2,0,2,1,1,0]
        sortColors(&colors)
        print(colors)
    }
}
