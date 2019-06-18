//
//  SetMatrixZeroes.swift
//  leetcode
//
//  Created by Henry on 2019/6/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SetMatrixZeroesSolution {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.count == 0 || matrix[0].count == 0 {
            return
        }
        
        /* Mark first row and first column */
        var firstZeroRow = false
        for i in 0..<matrix[0].count {
            if matrix[0][i] == 0 {
                firstZeroRow = true
                break
            }
        }
        var firstZeroColumn = false
        for i in 0..<matrix.count {
            if matrix[i][0] == 0 {
                firstZeroColumn = true
                break
            }
        }
        /* Mark column header and row header as zero when find zero. */
        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        /* Fill zero rows */
        for i in 1..<matrix.count {
            if matrix[i][0] == 0 {
                for j in 0..<matrix[i].count {
                    matrix[i][j] = 0
                }
            }
        }
        /* Fill zero columns */
        for i in 1..<matrix[0].count {
            if matrix[0][i] == 0 {
                for j in 0..<matrix.count {
                    matrix[j][i] = 0
                }
            }
        }
        if firstZeroRow {
            for i in 0..<matrix[0].count {
                matrix[0][i] = 0
            }
        }
        if firstZeroColumn {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }
    }
    
    func test() -> Void {
        var m1 = [[1,1,1],
                  [1,0,1],
                  [1,1,1]]
        setZeroes(&m1)
        print(m1)
        
        var m2 = [[0,1,2,0],
                  [3,4,5,2],
                  [1,3,1,5]]
        setZeroes(&m2)
        print(m2)
    }
}
