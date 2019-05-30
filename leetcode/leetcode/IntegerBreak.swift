//
//  IntegerBreak.swift
//  leetcode
//
//  Created by Henry on 2019/5/31.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class IntegerBreakSolution {
    func integerBreak(_ n: Int) -> Int {
        if n == 2 {
            return 1
        } else if n == 3 {
            return 2
        } else if n == 4 {
            return 4
        }
        
        var dp = [Int].init(repeating: 0, count:n+1)
        dp[2] = 1
        dp[3] = 2
        for i in 4...n {
            for j in 2..<i {
                dp[i] = max(dp[i], dp[j]*(i-j), j*(i-j))
            }
        }
        
        return dp[n]
    }
    
    func test() -> Void {
        print(integerBreak(2))
        print(integerBreak(10))
        print(integerBreak(5))
    }
}
