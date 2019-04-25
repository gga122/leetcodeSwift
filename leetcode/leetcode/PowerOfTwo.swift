//
//  PowerOfTwo.swift
//  leetcode
//
//  Created by Henry on 2019/4/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PowerOfTwoSolution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        
        return ((n - 1) & n) == 0;
    }
    
    func test() -> Void {
        print(isPowerOfTwo(1))
        print(isPowerOfTwo(16))
        print(isPowerOfTwo(218))
    }
}
