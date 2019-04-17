//
//  BinaryNumberWithAlternatingBits.swift
//  leetcode
//
//  Created by Henry on 2019/4/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryNumberWithAlternatingBitsSolution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        var m = n >> 1
        m ^= n
        while m > 0 {
            let a = m % 2
            if a == 0 {
                return false
            }
            
            m /= 2
        }
        
        return true
    }
    
    func test() -> Void {
        print(hasAlternatingBits(5))
        print(hasAlternatingBits(7))
        print(hasAlternatingBits(11))
        print(hasAlternatingBits(10))
    }
}
