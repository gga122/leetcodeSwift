//
//  MatrixBlockSum.swift
//  leetcode
//
//  Created by Henry on 2020/1/12.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MatrixBlockSumSolution {
    func matrixBlockSum(_ mat: [[Int]], _ K: Int) -> [[Int]] {
        if mat.count == 0 {
            return mat
        }
        if mat[0].count == 0 {
            return mat
        }
        if K == 0 {
            return mat
        }
        
        var map = [String: Int]()
        var res = mat
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                let minR = max(i - K, 0)
                let maxR = min(i + K, mat.count-1)
                let minC = max(j - K, 0)
                let maxC = min(j + K, mat[i].count-1)
                
                res[i][j] = 0
                for r in minR...maxR {
                    let k = "\(r)-\(minC)_\(maxC)"
                    var v = map[k]
                    if v == nil {
                        let sub = mat[r][minC...maxC]
                        v = sub.reduce(0, +)
                        map[k] = v
                    }
                    
                    res[i][j] += v!
                }
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 1))
        print(matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 2))
    }
}
