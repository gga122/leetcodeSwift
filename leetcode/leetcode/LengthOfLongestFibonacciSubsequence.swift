//
//  LengthOfLongestFibonacciSubsequence.swift
//  leetcode
//
//  Created by MickyZhu on 4/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class LengthOfLongestFibonacciSubsequenceSolution {
    func lenLongestFibSubseq(_ A: [Int]) -> Int {
        let N = A.count
        
        var indexes = [Int: Int]()
        for i in 0..<N {
            indexes[A[i]] = i
        }
        
        var longest = [Int: Int]()
        var res = 0
        
        for k in 0..<N {
            for j in 0..<k {
                let i = indexes[A[k]-A[j]] ?? -1
                
                if i >= 0 && i < j {
                    /* Treat Tuple (i,j) as Int (i * N + j) */
                    let cand = (longest[i*N+j] ?? 2) + 1
                    longest[j*N+k] = cand
                    res = max(res, cand)
                }
            }
        }
        
        return res >= 3 ? res : 0
    }
    
    func test() -> Void {
        print(lenLongestFibSubseq([1,2,3,4,5,6,7,8]))
//        print(lenLongestFibSubseq([1,3,7,11,12,14,18]))
    }
}
