//
//  SearchA2DMatrix.swift
//  leetcode
//
//  Created by Henry on 2019/5/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SearchA2DMatrixSolution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }
        if matrix[0].count == 0 {
            return false
        }
        
        var rStart = 0
        var rEnd = matrix.count - 1
        while rStart <= rEnd {
            let rMid = (rEnd - rStart) / 2 + rStart
            let row = matrix[rMid]
            var cStart = 0
            var cEnd = row.count - 1
            if target < row[cStart] {
                rEnd = rMid - 1
            } else if target > row[cEnd] {
                rStart = rMid + 1
            } else {
                while cStart <= cEnd {
                    let cMid = (cEnd - cStart) / 2 + cStart
                    if target == row[cMid] {
                        return true
                    } else if target < row[cMid] {
                        cEnd = cMid - 1
                    } else {
                        cStart = cMid + 1
                    }
                }
                
                return false
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(searchMatrix([[1,   3,  5,  7],
                            [10, 11, 16, 20],
                            [23, 30, 34, 50]], 3))
        print(searchMatrix([[1,   3,  5,  7],
                            [10, 11, 16, 20],
                            [23, 30, 34, 50]], 13))
    }
}
