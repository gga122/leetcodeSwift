//
//  TeemoAttacking.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TeemoAttackingSolution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        if timeSeries.count == 0 {
            return 0
        } else if timeSeries.count == 1 {
            return duration
        }
        
        var poisonedDuration = duration
        for i in (0..<timeSeries.count-1).reversed() {
            let currentDuration = timeSeries[i]+duration
            if currentDuration <= timeSeries[i+1] {
                poisonedDuration += duration
            } else {
                poisonedDuration += timeSeries[i+1] - timeSeries[i]
            }
        }
        
        return poisonedDuration
    }
    
    func test() -> Void {
        print(findPoisonedDuration([1,4], 2))
        print(findPoisonedDuration([1,2], 2))
        print(findPoisonedDuration([1,2,3,4,5], 5))
    }
}
