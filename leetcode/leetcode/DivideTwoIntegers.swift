//
//  DivideTwoIntegers.swift
//  leetcode
//
//  Created by Henry on 2019/6/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DivideTwoIntegersSolution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == 0 {
            return 0
        }
        
        var absDividend = abs(dividend)
        var absDivisor = abs(divisor)
        var currentBit = 1
        var result = 0

        while absDividend >= (absDivisor << 1) {
            absDivisor <<= 1
            currentBit <<= 1
        }
        
        while currentBit > 0 && absDividend > 0 {
            if absDividend >= absDivisor {
                absDividend -= absDivisor
                result += currentBit
            }
            currentBit >>= 1
            absDivisor >>= 1
        }
        
        result = (dividend ^ divisor < 0) ? -result : result;
        
        return result > INT32_MAX ? Int(Int32.max) : result
    }
    
    func test() -> Void {
        print(divide(10, 3))
    }
}
