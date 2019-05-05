//
//  SumOfTwoIntegers.swift
//  leetcode
//
//  Created by Henry on 2019/5/6.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SumOfTwoIntegersSolution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        if a == 0 {
            return b
        }
        if b == 0 {
            return a
        }
        
        return getSum(a ^ b, (a & b) << 1)
    }
    
    func test() -> Void {
        print(getSum(1, 2))
        print(getSum(-2, 3))
    }
}
