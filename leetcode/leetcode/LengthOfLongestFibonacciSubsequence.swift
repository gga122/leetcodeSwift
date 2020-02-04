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
        var set = Set<Int>()
        for num in A {
            set.insert(num)
        }
                
        var res = 0
        for i in 0..<A.count {
            for j in i+1..<A.count {
                var x = A[j]
                var y = A[i]+A[j]
                
                var length = 2
                while set.contains(y) {
                    /* x, y -> y, x+y */
                    
                    let tmp = x
                    x = y
                    y += tmp
                    length += 1
                    res = max(length, res)
                }
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(lenLongestFibSubseq([1,2,3,4,5,6,7,8]))
        print(lenLongestFibSubseq([1,3,7,11,12,14,18]))
    }
}
