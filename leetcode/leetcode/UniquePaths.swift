//
//  UniquePaths.swift
//  leetcode
//
//  Created by Henry on 2019/5/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UniquePathsSolution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        if m == 1 || n == 1 {
            return 1
        }

        var dp = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)
        for i in 1..<n {
            dp[i][0] = 1
        }
        for j in 1..<m {
            dp[0][j] = 1
        }
        for i in 1..<n {
            for j in 1..<m {
                dp[i][j] = dp[i][j-1] + dp[i-1][j]
            }
        }
        
        return dp[n-1][m-1]
    }
    
    func test() -> Void {
        print(uniquePaths(3, 2))
        print(uniquePaths(7, 3))
        print(uniquePaths(1, 10))
    }
}
