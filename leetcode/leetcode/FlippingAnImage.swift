//
//  FlippingAnImage.swift
//  leetcode
//
//  Created by Henry on 2019/4/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FlippingAnImageSolution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var B = A
        var i = 0
        while i < A.count {
            let a = A[i]
            var b: [Int] = a.reversed()
            var j = 0
            while j < b.count {
                b[j] ^= 1
                j += 1
            }
            
            B[i] = b
            i += 1
        }
        
        return B
    }
    
    func test() -> Void {
        print(flipAndInvertImage([[1, 1, 0], [1, 0, 1], [0, 0, 0]]))
        print(flipAndInvertImage([[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]))
    }
}
