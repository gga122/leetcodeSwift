//
//  PowerOfFour.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PowerOfFourSolution {
    func isPowerOfFour(_ num: Int) -> Bool {
        if num < 0 || num & (num - 1) != 0 {
            return false
        }
        
        return num % 3 == 1
    }
    
    func test() -> Void {
        print(isPowerOfFour(16))
        print(isPowerOfFour(5))
    }
}
