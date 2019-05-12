//
//  PartitionArrayIntoThreePartsWithEqualSum.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PartitionArrayIntoThreePartsWithEqualSumSolution {
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        if A.count < 3 {
            return false
        }
        
        var i = 0
        var j = A.count - 1
        let total = A.reduce(0, +)
        if total % 3 != 0 {
            return false
        }
        
        let target = total / 3
        var left = A[i]
        var right = A[j]
        while j - i > 1 {
            if left != target {
                i += 1
                left += A[i]
            }
            if right != target {
                j -= 1
                right += A[j]
            }
            
            if left == target && right == target {
                return true
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(canThreePartsEqualSum([0, 2, 1, -6, 6, -7, 9, 1, 2, 0, 1]))
        print(canThreePartsEqualSum([0, 2, 1, -6, 6, 7, 9, -1, 2, 0, 1]))
        print(canThreePartsEqualSum([3, 3, 6, 5, -2, 2, 5, 1, -9, 4]))
        print(canThreePartsEqualSum([6, 1, 1, 13, -1, 0, -10, 20]))
    }
}
