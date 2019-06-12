//
//  PaintFence.swift
//  leetcode
//
//  Created by Henry on 2019/6/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PaintFenceSolution {
    func numWays(_ n: Int, _ k: Int) -> Int {
        if k == 0 || n == 0 {
            return 0
        }
        if n == 1 {
            return k
        }
        
        var dp = [Int].init(repeating: 0, count: n)
        dp[0] = k
        dp[1] = k*k
        for i in 2..<n {
            dp[i] = (dp[i-1] + dp[i-2]) * (k-1)
        }
        
        return dp.last!
    }
    
    func test() -> Void {
        print(numWays(3, 2))
    }
}
