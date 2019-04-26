//
//  HouseRobber.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class HouseRobberSolution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums.first!
        }
        
        // f(n) = max(f(n - 2) + num[n], f(n - 1))
        
        if nums.count == 2 {
            return max(nums.first!, nums.last!)
        }
        
        var dp = [Int]()
        dp.append(nums[0])
        dp.append(max(nums[0], nums[1]))
        for i in 2...(nums.count - 1) {
            let v = max(dp[i - 2] + nums[i], dp[i - 1])
            dp.append(v)
        }
        
        return dp.last!
    }
    
    func test() -> Void {
        print(rob([1, 2, 3, 1]))
        print(rob([2, 7, 9, 3, 1]))
        print(rob([2, 1, 1, 2]))
    }
}
