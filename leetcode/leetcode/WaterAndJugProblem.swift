//
//  WaterAndJugProblem.swift
//  leetcode
//
//  Created by Henry on 2019/5/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class WaterAndJugProblemSolution {
    func canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        if z == 0 {
            return true
        }
        if x + y < z {
            return false
        }
        
        var minVal = min(x, y)
        var maxVal = max(x, y)
        if minVal == 0 {
            return maxVal == z
        }
        
        while maxVal % minVal != 0 {
            let val = maxVal % minVal
            maxVal = minVal
            minVal = val
        }
        
        return z % minVal == 0
    }
    
    func test() -> Void {
        print(canMeasureWater(3, 5, 4))
        print(canMeasureWater(2, 6, 5))
    }
}
