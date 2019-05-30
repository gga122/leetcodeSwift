//
//  Triangle.swift
//  leetcode
//
//  Created by Henry on 2019/5/31.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TriangleSolution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = [Int].init(repeating: Int.max, count: triangle.count)
        for i in 0..<triangle.count {
            let row = triangle[i]
            var tmpDP = dp
            for j in 0..<row.count {
                if i == 0 {
                    tmpDP[i] = row[j]
                } else {
                    let upRow = triangle[i-1]
                    
                    let upLeft = j - 1 >= 0 ? dp[j-1] : Int.max
                    let upRight = j < upRow.count ? dp[j] : Int.max
                    
                    tmpDP[j] = min(upLeft, upRight) + row[j]
                }
            }
            dp = tmpDP
        }
        
        var minValue = Int.max
        for v in dp {
            minValue = min(minValue, v)
        }
        return minValue
    }
    
    func test() -> Void {
        print(minimumTotal([[2],
                            [3,4],
                            [6,5,7],
                            [4,1,8,3]]))
    }
}
