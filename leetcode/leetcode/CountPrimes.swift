//
//  CountPrimes.swift
//  leetcode
//
//  Created by Henry on 2019/4/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CountPrimesSolution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else {
            return 0
        }
        guard n > 3 else {
            return 1
        }
        
        var nums = Array.init(repeating: true, count: n)
        nums[0] = false
        nums[1] = false
        for i in 2...(n - 1) {
            if nums[i] {
                var k = 2
                while true {
                    if k * i < n {
                        nums[k * i] = false
                    } else {
                        break
                    }
                    
                    k += 1
                }
            }
        }
        
        var c = 0
        for v in nums {
            if v {
                c += 1
            }
        }
        return c
    }
    
    func test() -> Void {
        print(countPrimes(10))
        print(countPrimes(2))
        print(countPrimes(3))
    }
}
