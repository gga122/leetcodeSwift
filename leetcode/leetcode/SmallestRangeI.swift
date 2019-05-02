//
//  SmallestRangeI.swift
//  leetcode
//
//  Created by Henry on 2019/5/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SmallestRangeISolution {
    func smallestRangeI(_ A: [Int], _ K: Int) -> Int {
        if A.count == 1 {
            return 0
        }
        
        var max = A[0]
        var min = A[0]
        for a in A {
            if a > max {
                max = a
            }
            if a < min {
                min = a
            }
        }
        
        if max - min > 2 * K {
            return max - min - 2 * K
        }
        return 0
    }
    
    func test() -> Void {
        print(smallestRangeI([1], 0))
        print(smallestRangeI([0, 10], 2))
        print(smallestRangeI([1, 3, 6], 3))
    }
}
