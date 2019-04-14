//
//  SqrtX.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SqrtXSolution {
    func mySqrt(_ x: Int) -> Int {
        if x == 1 {
            return x
        }
        
        var ceil = x
        var floor = 1
        var mid = (ceil + floor) / 2
        while true {
            let result = mid * mid
            if result > x {
                ceil = mid
            } else if (result < x) {
                floor = mid;
            } else {
                return mid
            }
            mid = (ceil + floor) / 2
            if mid == ceil || mid == floor {
                break
            }
        }
        
        return mid
    }
    
    func test() -> Void {
        print(mySqrt(4))
        print(mySqrt(8))
        print(mySqrt(1))
        print(mySqrt(2147395599))
    }
}
