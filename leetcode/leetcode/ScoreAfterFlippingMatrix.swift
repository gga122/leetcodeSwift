//
//  ScoreAfterFlippingMatrix.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ScoreAfterFlippingMatrixSolution {
    func matrixScore(_ A: [[Int]]) -> Int {
        var A = A
        
        let rowCount = A.count
        let columnCount = A[0].count
        /* make sure high bit mask is 1 */
        for i in 0..<rowCount {
            if A[i][0] == 0 {
                for j in 0..<columnCount {
                    A[i][j] = A[i][j] ^ 1
                }
            }
        }
        
        /* make all columns has more 1 as possible */
        var columnIndex = 1
        while columnIndex < columnCount {
            var zeroCount = 0
            for i in 0..<rowCount {
                if A[i][columnIndex] == 0 {
                    zeroCount += 1
                }
                
                if zeroCount * 2 > rowCount {
                    break
                }
            }
            if zeroCount * 2 > rowCount {
                for i in 0..<rowCount {
                    A[i][columnIndex] = A[i][columnIndex] ^ 1
                }
            }
            columnIndex += 1
        }
        
        var ret = 0
        for i in 0..<rowCount {
            var v = 0
            for j in 0..<columnCount {
                v = v << 1
                v |= A[i][j]
            }
            ret += v
        }
        
        return ret
    }
    
    func test() -> Void {
        print(matrixScore([[0,0,1,1],[1,0,1,0],[1,1,0,0]]))
    }
}
