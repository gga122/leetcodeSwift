//
//  LargestPerimeterTriangle.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LargestPerimeterTriangleSolution {
    func largestPerimeter(_ A: [Int]) -> Int {
        if A.count < 3 {
            return 0
        }
        
        var A = A.sorted()
        var lengthIndex1 = A.count - 1
        while lengthIndex1 >= 2 {
            if A[lengthIndex1 - 2] + A[lengthIndex1 - 1] > A[lengthIndex1] {
                return A[lengthIndex1] + A[lengthIndex1 - 1] + A[lengthIndex1 - 2]
            } else {
                lengthIndex1 -= 1
            }
        }
        return 0
    }
    
    func test() -> Void {
        print(largestPerimeter([2, 1, 2]))
        print(largestPerimeter([1, 2, 1]))
        print(largestPerimeter([3, 2, 3, 4]))
        print(largestPerimeter([3, 6, 2, 3]))
    }
}
