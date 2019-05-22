//
//  SpiralMatrix.swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SpiralMatrixSolution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rowCount = matrix.count
        if rowCount == 0 {
            return []
        }
        if rowCount == 1 {
            return matrix[0]
        }
        let columnCount = matrix[0].count
        
        var top = 0
        var bottom = rowCount - 1
        var left = 0
        var right = columnCount - 1
        
        var ret = [Int]()
        while top <= bottom || left <= right {
            if top <= bottom {
                for i in left..<right+1 {
                    ret.append(matrix[top][i])
                }
                top += 1
            }
            if left <= right {
                for i in top..<bottom+1 {
                    ret.append(matrix[i][right])
                }
                right -= 1
            }
            if top <= bottom {
                for i in (left..<right+1).reversed() {
                    ret.append(matrix[bottom][i])
                }
                bottom -= 1
            }
            if left <= right {
                for i in (top..<bottom+1).reversed() {
                    ret.append(matrix[i][left])
                }
                left += 1
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(spiralOrder([[ 1, 2, 3 ],
                           [ 4, 5, 6 ],
                           [ 7, 8, 9 ]]))
        print(spiralOrder([[1, 2, 3, 4],
                           [5, 6, 7, 8],
                           [9,10,11,12]]))
    }
}
