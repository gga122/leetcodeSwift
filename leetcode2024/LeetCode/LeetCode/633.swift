//
//  633.swift
//  LeetCode
//
//  Created by henry on 2024/11/15.
//

import Foundation

class Solution_633 {
    func judgeSquareSum(_ c: Int) -> Bool {
        /**
         考虑到 a * a + b * b = c, 则 a 或 b 必然小于等于 c 的开根. 原因同 `寻找质数` 问题
         */
        let sqrtVal = Int(ceil(sqrt(Double(c))))
        
        var a = 0
        var b = sqrtVal
        while a <= b {
            let v = a * a + b * b
            /**
             从左右两侧分别逼近
             */
            if v == c {
                return true
            } else if v < c {
                a += 1
            } else {
                b -= 1
            }
        }
        
        return false
    }
}
