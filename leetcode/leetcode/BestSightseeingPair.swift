//
//  BestSightseeingPair.swift
//  leetcode
//
//  Created by Henry on 2019/5/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BestSightseeingPairSolution {
    func maxScoreSightseeingPair(_ A: [Int]) -> Int {
        /*
         F = (A[i] + i) + (A[j] - j)
         F_max = (A[i] + i)_max + (A[j] - j)_max
         */
        var left = A[0]
        var res = Int.min
        for i in 1..<A.count {
            res = max(res, left+A[i]-i)
            left = max(left, A[i]+i)
        }
        return res
    }
    
    func test() -> Void {
        print(maxScoreSightseeingPair([8,1,5,2,6]))
    }
}
