//
//  PlusOne.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PlusOneSolution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var idx = 0
        var carry = false
        repeat {
            let index = digits.count - 1 - idx;
            var v = digits[index]
            v += 1
            if v <= 9 {
                digits[index] = v
                carry = false
            } else {
                v -= 10
                digits[index] = v
                carry = true
            }
            idx += 1
        } while idx < digits.count && carry
        
        if carry {
            digits.insert(1, at: 0)
        }
        
        return digits
    }
    
    func test() -> Void {
        print(plusOne([1, 2, 3]))
        print(plusOne([4, 3, 2, 1]))
        print(plusOne([9]))
        print(plusOne([9, 9]))
        print(plusOne([8, 9, 9, 9]))
    }
}
