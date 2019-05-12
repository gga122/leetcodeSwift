//
//  SumOfSquareNumbers.swift
//  leetcode
//
//  Created by Henry on 2019/5/13.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SumOfSquareNumbersSolution {
    func judgeSquareSum(_ c: Int) -> Bool {
        let sqrtValue = sqrt(Double(c))
        let max = Int(floor(sqrtValue))
        var start = 0
        var end = max
        while start <= end {
            let v = start * start + end * end
            if v == c {
                return true
            } else if v < c {
                start += 1
            } else {
                end -= 1
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(judgeSquareSum(5))
        print(judgeSquareSum(3))
        print(judgeSquareSum(2147482647))
    }
}
