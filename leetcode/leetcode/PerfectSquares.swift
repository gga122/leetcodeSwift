//
//  PerfectSquares.swift
//  leetcode
//
//  Created by Henry on 2020/1/14.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class PerfectSquaresSolution {
    func numSquares(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        
        var dp = [Int].init(repeating: 0, count: n+1)
        dp[0] = 0
        dp[1] = 1
        for i in 2...n {
            if isPerfectNumber(i) {
                dp[i] = 1
            } else {
                var minDP = i
                var j = 1
                while i - j * j > 0 {
                    minDP = min(minDP, dp[i-j*j] + 1)
                    j += 1
                }
                
                dp[i] = minDP
            }
        }
        
        return dp[n]
    }
    
    func isPerfectNumber(_ n: Int) -> Bool {
        if n == 0 || n == 1 {
            return false
        }
        
        let sqrtNum = sqrt(Double(n))
        let floorNum = Int(floor(sqrtNum))
        return n == floorNum * floorNum
    }
    
    func test() -> Void {
//        print(numSquares(12))
//        print(numSquares(13))
        print(numSquares(6337))
    }
}
