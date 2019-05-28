//
//  HouseRobberII.swift
//  leetcode
//
//  Created by Henry on 2019/5/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class HouseRobberIISolution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        /* Start from 0 and skip the last */
        var dp1 = [Int].init(repeating: 0, count: nums.count-1)
        dp1[0] = nums[0]
        dp1[1] = max(dp1[0], nums[1])
        /* Skip the first and start from 1 */
        var dp2 = [Int].init(repeating: 0, count: nums.count-1)
        dp2[0] = nums[1]
        dp2[1] = max(dp2[0], nums[2])
        for i in 2..<nums.count-1 {
            dp1[i] = max(dp1[i-2]+nums[i], dp1[i-1])
            dp2[i] = max(dp2[i-2]+nums[i+1], dp2[i-1])
        }
        
        return max(dp1.last!, dp2.last!)
    }
    
    func test() -> Void {
        print(rob([2,3,2]))
        print(rob([1,2,3,1]))
        print(rob([1,3,1,3,100]))
    }
}
