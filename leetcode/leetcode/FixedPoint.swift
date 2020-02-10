//
//  FixedPoint.swift
//  leetcode
//
//  Created by MickyZhu on 10/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class FixedPointSolution {
    func fixedPoint(_ A: [Int]) -> Int {
        for i in 0..<A.count {
            if A[i] == i {
                return i
            }
        }
        
        return -1
    }
    
    func test() -> Void {
        print(fixedPoint([-10,-5,0,3,7]))
        print(fixedPoint([0,2,5,8,17]))
        print(fixedPoint([-10,-5,3,4,7,9]))
    }
}
