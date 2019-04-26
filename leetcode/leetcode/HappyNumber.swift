//
//  HappyNumber.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class HappyNumberSolution {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var nums = Dictionary<Int, Bool>.init()
        while n != 1 {
            var m = n
            if nums[n] != nil {
                return false
            } else {
                nums[n] = false
            }
            
            n = 0
            while m > 0 {
                let v = m % 10
                if v != 0 {
                    n += v * v
                }
                m /= 10
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(isHappy(19))
        print(isHappy(2))
    }
}
