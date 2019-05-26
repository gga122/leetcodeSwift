//
//  RotateImage.swift
//  leetcode
//
//  Created by Henry on 2019/5/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RotateImageSolution {
    func rotate(_ matrix: inout [[Int]]) {
        let rowCount = matrix.count
        if rowCount == 0 {
            return
        }
        let columnCount = matrix[0].count
        if rowCount != columnCount {
            return
        }
        if rowCount == 1 {
            return
        }
        
        for i in 0..<rowCount/2 {
            let start = i
            let end = rowCount-i-1
            for j in 0..<end-start {
                let tmp = matrix[start][start+j]
                matrix[start][start+j] = matrix[end-j][start]
                matrix[end-j][start] = matrix[end][end-j]
                matrix[end][end-j] = matrix[start+j][end]
                matrix[start+j][end] = tmp
            }
        }
    }
    
    func test() -> Void {
        var matrix1 = [[1,2,3],
                       [4,5,6],
                       [7,8,9]]
        rotate(&matrix1)
        print(matrix1)
        var matrix2 = [[1,2,3,4,5],
                       [6,7,8,9,10],
                       [11,12,13,14,15],
                       [16,17,18,19,20],
                       [21,22,23,24,25]]
        rotate(&matrix2)
        print(matrix2)
    }
}
