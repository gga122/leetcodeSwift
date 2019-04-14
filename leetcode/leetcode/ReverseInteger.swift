//
//  ReverseInteger.swift
//  leetcode
//
//  Created by Henry on 2019/4/14.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReverseIntegerSolution {
    func reverse(_ x: Int) -> Int {
        if -9 < x && x < 9 {
            return x
        }

        var x = x
        let isNegative = x < 0
        if isNegative {
            x = -x
        }
        var revertedNumber = 0
        while x > 0 {
            revertedNumber = revertedNumber * 10 + x % 10
            x /= 10
        }
        if revertedNumber > INT32_MAX {
            return 0
        }
        
        return isNegative ? -revertedNumber : revertedNumber;
    }
    
    func test() -> Void {
        print(reverse(123))
        print(reverse(-123))
        print(reverse(120))
        print(reverse(1534236469))
    }
}
