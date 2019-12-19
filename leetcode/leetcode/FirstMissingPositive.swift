//
//  FirstMissingPositive.swift
//  leetcode
//
//  Created by MickyZhu on 19/12/2019.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FirstMissingPositiveSolution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 1
        }
        
        var psRetValue = 1
        var psMinValue = Int.max
        for num in nums {
            if num <= 0 {
                continue
            }
            psMinValue = min(psMinValue, num)
            if num == psRetValue {
                psRetValue += 1
            }
        }
        
        var rsRetValue = 1
        var rsMinValue = Int.max
        for num in nums {
            if num <= 0 {
                continue
            }
            rsMinValue = min(rsMinValue, num)
            if num == rsRetValue {
                rsRetValue += 1
            }
        }
        print("\(psMinValue) - \(rsMinValue) | \(psRetValue) - \(rsRetValue)")
        
        if psMinValue == rsMinValue {
            
        }
        
        if psMinValue <= 1 {
            return psRetValue
        }
        psRetValue = min(psRetValue, psMinValue - 1)
        
        return psRetValue
    }
    
    func test() -> Void {
        print(firstMissingPositive([1,2,0]))
        print(firstMissingPositive([3,4,-1,1]))
        print(firstMissingPositive([7,8,9,11,12]))
        print(firstMissingPositive([1,2,3,4,5]))
        print(firstMissingPositive([-1,-1,-1,0]))
        print(firstMissingPositive([0]))
        print(firstMissingPositive([2,1]))
        print(firstMissingPositive([2,4,6,1,2,4]))
    }
}
