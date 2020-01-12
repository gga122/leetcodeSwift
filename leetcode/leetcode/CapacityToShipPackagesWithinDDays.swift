//
//  CapacityToShipPackagesWithinDDays.swift
//  leetcode
//
//  Created by Henry on 2020/1/12.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class CapacityToShipPackagesWithinDDaysSolution {
    func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        var begin = weights.reduce(0) { (previous, current) -> Int in
            return max(previous, current)
        }
        var end = weights.reduce(0, +)
        
        while begin < end {
            let mid = begin + (end - begin) / 2
            let count = daysOfShip(weights, mid)
            if count > D {
                begin = mid + 1
            } else {
                end = mid
            }
        }
        
        return begin
    }
    
    func daysOfShip(_ weights: [Int], _ maxWeight: Int) -> Int {
        var count = 0
        var remain = maxWeight
        var i = 0
        while i < weights.count {
            let weight = weights[i]
            if remain < weight {
                remain = maxWeight
                count += 1
            }
            
            remain -= weight
            i += 1
        }
        if remain != maxWeight {
            count += 1
        }
        
        return count
    }
    
    func test() -> Void {
        print(shipWithinDays([1,2,3,4,5,6,7,8,9,10], 5))
        print(shipWithinDays([3,2,2,4,1,4], 3))
        print(shipWithinDays([1,2,3,1,1], 4))
    }
}
