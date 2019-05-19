//
//  SingleNumberIII.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SingleNumberIIISolution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var a = 0
        for num in nums {
            a ^= num
        }
        
        var n = 0
        for i in 0..<a.bitWidth {
            if a>>i & 1 != 0 {
                n = i
                break
            }
        }
        
        var x = 0
        var y = 0
        for num in nums {
            if num>>n & 1 != 0 {
                x ^= num
            } else {
                y ^= num
            }
        }
        
        return [x, y]
    }
    
    func test() -> Void {
        print(singleNumber([1,2,1,3,2,5]))
    }
}
