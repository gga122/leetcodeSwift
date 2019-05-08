//
//  ComplementOfBase10Integer.swift
//  leetcode
//
//  Created by Henry on 2019/5/8.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ComplementOfBase10IntegerSolution {
    func bitwiseComplement(_ N: Int) -> Int {
        if N == 0 {
            return 1
        }
        
        var N = N
        var ret = 0
        var offset = 0
        while N > 0 {
            var lastBit = N % 2
            lastBit = lastBit ^ 1
            lastBit = lastBit << offset
            ret = ret | lastBit
            N = N >> 1
            offset += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(bitwiseComplement(5))
        print(bitwiseComplement(7))
        print(bitwiseComplement(10))
    }
}
