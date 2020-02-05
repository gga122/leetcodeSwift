//
//  SumOfDigitsInTheMinimumNumber.swift
//  leetcode
//
//  Created by MickyZhu on 5/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class SumOfDigitsInTheMinimumNumberSolution {
    func sumOfDigits(_ A: [Int]) -> Int {
        guard A.count > 0 else {
            return 0
        }
        
        var minVal = Int.max
        for n in A {
            minVal = min(minVal, n)
        }
                
        var res = 0
        while minVal > 0 {
            res += minVal % 10
            minVal /= 10
        }
        
        return res % 2 == 0 ? 1 : 0
    }
    
    func test() -> Void {
        print(sumOfDigits([34,23,1,24,75,33,54,8]))
        print(sumOfDigits([99,77,33,66,55]))
    }
}
