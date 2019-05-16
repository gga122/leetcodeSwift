//
//  CountingBits.swift
//  leetcode
//
//  Created by Henry on 2019/5/16.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CountingBitsSolution {
    func countBits(_ num: Int) -> [Int] {
        if num < 0 {
            return []
        }
        
        var ret = Array<Int>.init(repeating: 0, count: num + 1)
        var i = 1
        while i <= num {
            /* We have calculated the count of bits before when shift to right 1bit,
             so we just add 1 if the last bit if i is 1. */
            ret[i] = ret[i >> 1] + (i & 1)
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(countBits(2))
        print(countBits(5))
    }
}
