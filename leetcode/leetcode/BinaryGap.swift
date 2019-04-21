//
//  BinaryGap.swift
//  leetcode
//
//  Created by Henry on 2019/4/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryGapSolution {
    func binaryGap(_ N: Int) -> Int {
        if N < 2 {
            return 0
        }
        
        var n = N
        var a = -1
        var idx = 0
        var max = 0
        while n > 0 {
            let m = n % 2
            if m == 1 {
                if a >= 0 {
                    let distance = idx - a
                    if distance > max {
                        max = distance
                    }
                }
                
                a = idx
            }
            
            n = n / 2
            
            idx += 1
        }
        
        return max
    }
    
    func test() -> Void {
        print(binaryGap(22))
        print(binaryGap(5))
        print(binaryGap(6))
        print(binaryGap(8))
    }
}
