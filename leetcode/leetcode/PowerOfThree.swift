//
//  PowerOfThree.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PowerOfThreeSolution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        if n == 1 {
            return true
        }
        
        var n = n
        while n % 3 == 0 {
            n /= 3
            
            if (n == 1) {
                return true
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(isPowerOfThree(27))
        print(isPowerOfThree(0))
        print(isPowerOfThree(9))
        print(isPowerOfThree(45))
    }
}
