//
//  ToeplitzMatrix.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ToeplitzMatrixSolution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        if matrix.count == 0 {
            return true
        }
        
        var lastRow: [Int]? = nil
        for row in matrix {
            if lastRow == nil {
                lastRow = row
                continue
            }
            
            lastRow!.removeLast()
            var parts = row
            parts.removeFirst()
            if lastRow != parts {
                return false
            }
            
            lastRow = row
        }
        
        return true
    }
    
    func test() -> Void {
        print(isToeplitzMatrix([[1,2,3,4],
                                [5,1,2,3],
                                [9,5,1,2]]))
        print(isToeplitzMatrix([[1,2],
                                [2,2]]))
    }
}
