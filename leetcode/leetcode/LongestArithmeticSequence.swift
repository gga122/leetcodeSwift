//
//  LongestArithmeticSequence.swift
//  leetcode
//
//  Created by MickyZhu on 2/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class LongestArithmeticSequenceSolution {
    func longestArithSeqLength(_ A: [Int]) -> Int {
        if A.count == 0 {
            return 0
        }
        
        var distances = Set<Int>.init()
        var res = [[Int]]()
        for i in 0..<A.count {
            for j in i+1..<A.count {
                let distance = A[i] - A[j]
                if distances.contains(distance) {
                    continue
                }
                
                var sequence = [Int]()
                sequence.append(A[i])
                sequence.append(A[j])
                // distances.insert(distance)
                
                var nextVal = A[j] - distance
                for k in j+1..<A.count {
                    if A[k] == nextVal {
                        sequence.append(A[k])
                        nextVal = A[k] - distance
                    }
                }
                
                res.append(sequence)
            }
        }
        
        var maxLength = 0
        for sequence in res {
            maxLength = max(sequence.count, maxLength)
        }
        
        return maxLength
    }
    
    func test() -> Void {
//        print(longestArithSeqLength([3,6,9,12]))
//        print(longestArithSeqLength([9,4,7,2,10]))
//        print(longestArithSeqLength([20,1,15,3,10,5,8]))
//        print(longestArithSeqLength([44,46,22,68,45,66,43,9,37,30,50,67,32,47,44,11,15,4,11,6,20,64,54,54,61,63,23,43,3,12,51,61,16,57,14,12,55,17,18,25,19,28,45,56,29,39,52,8,1,21,17,21,23,70,51,61,21,52,25,28]))
        print(longestArithSeqLength([25,78,45,27,75,10,90,77,60,8,43,5,55,47,57,17,8,63,18,69,63,87,35,19,78,42,25,27,24,23,88,56,14,42,16,64,8,62,48,76,66,75,59,43,16,11,15,41,20,34,69,69,58,42,22,27,79,81,63,59,57,51,11,48,89,29,30,79,40,87,17,24,16,82,18,9,86,9,90,74,17,21,8,18,24,62,8,31,84,56,70,59,55,22,44,31,11,82,80,38]))
    }
}
