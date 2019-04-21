//
//  BinaryPrefixDivisibleBy5.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryPrefixDivisibleBy5Solution {
    func prefixesDivBy5(_ A: [Int]) -> Array<Bool> {
        var r = Array<Bool>.init()
        var n = 0
        for i in A {
            /*
             Watch out `over flow with Int`
             
             (a + b) % c = ((a % c) + (b % c)) % c
             a / 5 = b...c {a = 5b + c}
             (2a) / 5 = (10b + 2c) / 5
             (2a) % 5 = 2c % 5
             
             */
            n = 2 * n
            n = n % 5
            n = n + i
            let v = n % 5
            r.append(v == 0)
        }
        
        return r
    }
    
    func test() -> Void {
        print(prefixesDivBy5([0, 1, 1]))
        print(prefixesDivBy5([1, 1, 1]))
        print(prefixesDivBy5([0, 1, 1, 1, 1, 1]))
        print(prefixesDivBy5([1, 1, 1, 0, 1]))
        print(prefixesDivBy5([1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1,
                              0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0]))
    }
}
