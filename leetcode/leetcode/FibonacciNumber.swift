//
//  FibonacciNumber.swift
//  leetcode
//
//  Created by Henry on 2019/4/16.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FibonacciNumberSolution {
    func fib(_ N: Int) -> Int {
        if N == 0 {
            return 0
        }
        
        if N == 1 {
            return 1
        }
        
        var a = 0
        var b = 1
        var tmp = 0
        for _ in 2...N {
            tmp = a + b
            a = b
            b = tmp
        }
        
        return tmp
    }
    
    func test() -> Void {
        print(fib(2))
        print(fib(3))
        print(fib(4))
    }
}
