//
//  PerfectNumber.swift
//  leetcode
//
//  Created by Henry on 2019/5/13.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PerfectNumberSolution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        if num <= 3 {
            return false
        }
        
        let upper = Int(floor(sqrt(Double(num))))
        var sum = 1
        for i in 2...upper {
            if num % i == 0 {
                sum += i
                sum += num / i
            }
        }
    
        return num == sum
    }
    
    func test() -> Void {
        print(checkPerfectNumber(28))
        print(checkPerfectNumber(99999994))
    }
}
