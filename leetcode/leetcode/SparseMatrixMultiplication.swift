//
//  SparseMatrixMultiplication.swift
//  leetcode
//
//  Created by Henry on 2020/1/18.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class SparseMatrixMultiplicationSolution {
    func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        if A.count == 0 || A.first?.count == 0 || B.count == 0 || B.first?.count == 0 {
            return []
        }
        
        var C = [[Int]].init(repeating: [Int].init(repeating: 0, count: B[0].count), count: A.count)
        for i in 0..<A.count {
            let row = A[i]
            for j in 0..<B[0].count {
                for k in 0..<B.count {
                    C[i][j] += row[k] * B[k][j]
                }
            }
        }
        
        return C
    }
    
    func test() -> Void {
        print(multiply([[ 1, 0, 0],
                        [-1, 0, 3]], [[ 7, 0, 0 ],
                                      [ 0, 0, 0 ],
                                      [ 0, 0, 1 ]]))
        print(multiply([[1,-5]], [[12],[-1]]))
    }
}
