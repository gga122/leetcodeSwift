//
//  TheKWeakestRowsInAMatrix.swift
//  leetcode
//
//  Created by MickyZhu on 2/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class TheKWeakestRowsInAMatrixSolution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var sums = [Int]()
        
        for row in mat {
            let count = row.reduce(0, +)
            sums.append(count)
        }

        var indexes = [(Int, Int)]()
        for i in 0..<sums.count {
            indexes.append((i, sums[i]))
        }
                
        indexes.sort { (seq1, seq2) -> Bool in
            return seq1.1 < seq2.1
        }
        
        let sub = indexes[0..<k]
        let flatSub = sub.map { (seq) -> Int in
            return seq.0
        }
        
        return flatSub
    }
    
    func test() -> Void {
        print(kWeakestRows([[1,1,0,0,0],
                            [1,1,1,1,0],
                            [1,0,0,0,0],
                            [1,1,0,0,0],
                            [1,1,1,1,1]], 3))
    }
}
