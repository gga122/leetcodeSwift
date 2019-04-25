//
//  FactorialTrailingZeroes.swift
//  leetcode
//
//  Created by Henry on 2019/4/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FactorialTrailingZeroesSolution {
    func trailingZeroes(_ n: Int) -> Int {
        if n <= 1 {
            return 0
        }
        
        var n = n
        var zeroCount = 0
        while n >= 5 {
            n /= 5
            zeroCount += n
        }
        
        return zeroCount
    }
    
    func test() -> Void {
        print(trailingZeroes(3))
        print(trailingZeroes(5))
    }
}
