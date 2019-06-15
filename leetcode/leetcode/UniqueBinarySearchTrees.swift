//
//  UniqueBinarySearchTrees.swift
//  leetcode
//
//  Created by Henry on 2019/6/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UniqueBinarySearchTreesSolution {
    func numTrees(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        
        /*
         G(n) = f(1) + f(2) + f(3) + ... + f(n)
         f(i) = G(i-1) * G(n-i)
         
         G(n) = G(0) * G(n-1) + G(1) * G(n-2) + ... + G(n-1) * G(0)
         */
        
        var dp = [Int].init(repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        for i in 2..<n+1 {
            for j in 1..<i+1 {
                dp[i] += dp[j-1] * dp[i-j]
            }
        }
        
        return dp[n]
    }
    
    func test() -> Void {
        print(numTrees(3))
    }
}
