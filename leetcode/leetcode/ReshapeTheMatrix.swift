//
//  ReshapeTheMatrix.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReshapeTheMatrixSolution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        if nums.count == 0 || nums.count * nums.first!.count < r * c {
            return nums
        }
        
        var matrix = Array.init(repeating: Array.init(repeating: 0, count: c), count: r)
        let rowCount = nums.count
        var rowIndex = 0
        var rIndex = 0
        var cIndex = 0
        while rowIndex < rowCount {
            let row = nums[rowIndex]
            let columnCount = row.count
            
            var columnIndex = 0
            while columnIndex < columnCount {
                matrix[rIndex][cIndex] = row[columnIndex]
                cIndex += 1
                if cIndex == c {
                    rIndex += 1
                    cIndex = 0
                }
                
                columnIndex += 1
            }
            
            rowIndex += 1
        }
        
        return matrix
    }
    
    func test() -> Void {
        print(matrixReshape([[1, 2], [3, 4]], 1, 4))
        print(matrixReshape([[1, 2], [3, 4]], 2, 4))
        print(matrixReshape([[1, 2], [3, 4]], 4, 1))
    }
}
