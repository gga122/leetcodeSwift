//
//  CountSquareSubmatricesWithAllOnes.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CountSquareSubmatricesWithAllOnesSolution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        
        dp[0][0] = matrix[0][0] == 1 ? 1 : 0
        for x in 1..<m {
            for y in 1..<n {
                if x != y {
                    
                } else {
                    
                }
                if matrix[x][y] == 0 {
                    dp[x][y] = dp[x-1][y] + dp[x][y-1]
                } else {
                    
                }
            }
        }
        
        return dp[m-1][n-1]
    }
    
    func test() -> Void {
        print(countSquares([[0,1,1,1],
                            [1,1,1,1],
                            [0,1,1,1]]))
        print(countSquares([[1,0,1],
                            [1,1,0],
                            [1,1,0]]))
    }
}
