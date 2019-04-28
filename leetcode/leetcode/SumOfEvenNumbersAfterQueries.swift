//
//  SumOfEvenNumbersAfterQueries.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SumOfEvenNumbersAfterQueriesSolution {
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        if queries.count == 0 {
            return A
        }
        
        var sum = 0
        for a in A {
            if a % 2 == 0 {
                sum += a
            }
        }
        
        var ret = [Int].init(repeating: 0, count: A.count)
        var A = A
        var i = 0
        while i < queries.count {
            let val = queries[i][0]
            let index = queries[i][1]
            if A[index] % 2 == 0 && val % 2 != 0 {
                sum -= A[index]
                A[index] += val
            } else if A[index] % 2 != 0 && val % 2 == 0 {
                A[index] += val
            } else {
                if A[index] % 2 == 0 {
                    sum += val
                    A[index] += val
                } else {
                    A[index] += val
                    sum += A[index]
                }
            }
            ret[i] = sum
            
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(sumEvenAfterQueries([1, 2, 3, 4], [[1, 0], [-3, 1], [-4, 0], [2, 3]]))
    }
}
