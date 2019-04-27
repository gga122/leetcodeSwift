//
//  UglyNumber.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UglyNumberSolution {
    func isUgly(_ num: Int) -> Bool {
        if num <= 0 {
            return false
        }
        if num == 1 {
            return true
        }
        
        var num = abs(num)
        while num > 1 {
            if num % 2 == 0 {
                num /= 2
                continue
            }
            if num % 3 == 0 {
                num /= 3
                continue
            }
            if num % 5 == 0 {
                num /= 5
                continue
            }
            
            return false
        }
        
        return true
    }
    
    func test() -> Void {
        print(isUgly(6))
        print(isUgly(8))
        print(isUgly(14))
        print(isUgly(-2147483648))
    }
}
