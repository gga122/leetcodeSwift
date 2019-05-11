//
//  MonotonicArray.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MonotonicArraySolution {
    func isMonotonic(_ A: [Int]) -> Bool {
        if A.count <= 2 {
            return true
        }
        
        let increase = A.first! < A.last!
        for n in 1...A.count - 1 {
            if increase {
                if A[n] < A[n - 1] {
                    return false
                }
            } else {
                if A[n] > A[n - 1] {
                    return false
                }
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(isMonotonic([1, 2, 2, 3]))
        print(isMonotonic([6, 5, 4, 4]))
        print(isMonotonic([1, 3, 2]))
        print(isMonotonic([1, 2, 4, 5]))
        print(isMonotonic([1, 1, 1]))
    }
}
