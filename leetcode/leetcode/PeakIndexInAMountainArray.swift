//
//  PeakIndexInAMountainArray.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PeakIndexInAMountainArraySolution {
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        var max = 0
        var index = 0
        var i = 0
        while i < A.count {
            if A[i] > max {
                max = A[i]
                index = i
            }
            i += 1
        }
        
        return index
    }
    
    func test() -> Void {
        print(peakIndexInMountainArray([0, 1, 0]))
        print(peakIndexInMountainArray([0, 2, 1, 0]))
    }
}
