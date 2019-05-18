//
//  SpiralMatrixII.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SpiralMatrixIISolution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        if n == 0 {
            return []
        }
        if n == 1 {
            return [[1]]
        }
        
        var matrix: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
        var top = 0
        var bottom = n - 1
        var left = 0
        var right = n - 1
        var i = 0
        while i < n * n {
            /* left to right */
            for j in left...right {
                matrix[top][j] = i + 1
                i += 1
            }
            top += 1
            if i >= n * n {
                break
            }
            
            /* top to bottom */
            for j in top...bottom {
                matrix[j][right] = i + 1
                i += 1
            }
            right -= 1
            if i >= n * n {
                break
            }
            
            /* right to left */
            for k in (left...right).reversed() {
                matrix[bottom][k] = i + 1
                i += 1
            }
            bottom -= 1
            if i >= n * n {
                break
            }
            
            /* bottom to top */
            for l in (top...bottom).reversed() {
                matrix[l][left] = i + 1
                i += 1
            }
            left += 1
            if i >= n * n {
                break
            }
        }
        
        return matrix
    }
    
    func test() -> Void {
        print(generateMatrix(3))
    }
}
