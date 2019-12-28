//
//  SumOfMutatedArrayClosestToTarget.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SumOfMutatedArrayClosestToTargetSolution {
    func findBestValue(_ arr: [Int], _ target: Int) -> Int {
        if arr.count == 1 {
            return arr[0]
        }
        
        let sortedArray = arr.sorted()
        let total = sortedArray.reduce(0, +)
        let over = total - target
        if over <= 0 {
            return sortedArray.last!
        }
        
        let average = Float(target) / Float(arr.count)
        let base = floor(average)
        let averageInt = (average - base) > 0.5 ? Int(ceil(average)) : Int(base)
        
        if sortedArray[0] > averageInt {
            return averageInt
        }
        
        var previousDistance: Int? = nil
        var previousV: Int? = nil
        for v in sortedArray[0]...sortedArray[sortedArray.count-1] {
            let sum = sortedArray.reduce(0) { (last, current) -> Int in
                if current < v {
                    return last + current
                } else {
                    return last + v
                }
            }
            
            if previousDistance == nil {
                previousDistance = abs(target - sum)
                previousV = v
            } else {
                let distance = abs(target - sum)
                if distance < previousDistance! {
                    previousDistance = distance
                    previousV = v
                } else {
                    break
                }
            }
        }
        
        return previousV!
    }
    
    func test() -> Void {
        print(findBestValue([4,9,3], 10))
        print(findBestValue([2,3,5], 10))
        print(findBestValue([60864,25176,27249,21296,20204], 56803))
        print(findBestValue([1547,83230,57084,93444,70879], 71237))
    }
}
