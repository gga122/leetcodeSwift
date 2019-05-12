//
//  MaximizeSumOfArrayAfterKNegations.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximizeSumOfArrayAfterKNegationsSolution {
    func largestSumAfterKNegations(_ A: [Int], _ K: Int) -> Int {
        var A = A
        A.sort()
        var K = K
        var minAbs = Int.max
        /* Reverse all negative numbers */
        for i in 0..<A.count {
            minAbs = min(minAbs, abs(A[i]))
            if A[i] < 0 {
                A[i] = -A[i]
                K -= 1
                if K == 0 {
                    return A.reduce(0, +)
                }
            } else if A[i] == 0 {
                return A.reduce(0, +)
            } else {
                break
            }
        }
        
        var sum = A.reduce(0, +)
        /* Reverse minimum number, diff is double value */
        if K % 2 != 0 {
            sum -= 2 * minAbs
        }
        
        return sum
    }
    
    func test() -> Void {
        print(largestSumAfterKNegations([4, 2, 3], 1))
        print(largestSumAfterKNegations([3, -1, 0, 2], 3))
        print(largestSumAfterKNegations([2, -3, -1, 5, -4], 2))
        print(largestSumAfterKNegations([-4, -6, 9, -2, 2], 4))
    }
}
