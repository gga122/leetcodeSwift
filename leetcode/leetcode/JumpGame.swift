//
//  JumpGame.swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class JumpGameSolution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return false
        }
        
        var i = 0
        var maxIndex = nums[0] + i
        while i <= maxIndex {
            maxIndex = max(maxIndex, nums[i] + i)
            if maxIndex >= nums.count - 1 {
                return true
            }
            
            i += 1
        }
        
        return false
    }
    
    func test() -> Void {
        print(canJump([2,3,1,1,4]))
        print(canJump([3,2,1,0,4]))
        print(canJump([1,1,1,0]))
        print(canJump([0]))
    }
}
