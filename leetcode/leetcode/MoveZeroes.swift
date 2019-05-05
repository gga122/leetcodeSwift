//
//  MoveZeroes.swift
//  leetcode
//
//  Created by Henry on 2019/5/6.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MoveZeroesSolution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var j = 0
        while i < nums.count {
            if nums[i] != 0 {
                nums[j] = nums[i]
                j += 1
            }
            i += 1
        }
        
        while j < nums.count {
            nums[j] = 0
            j += 1
        }
    }
    
    func test() -> Void {
        var nums = [0, 1, 0, 3, 12]
        moveZeroes(&nums)
        print(nums)
    }
}
