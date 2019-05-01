//
//  TransposeMatrix.swift
//  leetcode
//
//  Created by Henry on 2019/5/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TransposeMatrixSolution {
    func transpose(_ A: [[Int]]) -> [[Int]] {
        if A.count == 0 {
            return []
        }
        
        let columnCount = A[0].count
        let rowCount = A.count
        var ret = Array.init(repeating: [Int](), count: columnCount)
        var i = 0
        while i < columnCount {
            var j = 0
            while j < rowCount {
                let v = A[j][i]
                ret[i].append(v)
                j += 1
            }
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
        print(transpose([[1, 2, 3], [4, 5, 6]]))
    }
}
