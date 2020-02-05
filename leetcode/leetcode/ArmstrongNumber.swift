//
//  ArmstrongNumber.swift
//  leetcode
//
//  Created by MickyZhu on 5/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ArmstrongNumberSolution {
    func isArmstrong(_ N: Int) -> Bool {
        var n = N
        
        var digits = [Int]()
        while n > 0 {
            let digit = n % 10
            digits.append(digit)
            n /= 10
        }
        
        let k = digits.count
        var newN = 0
        for digit in digits {
            if digit <= 1 {
                newN += digit
                continue
            }
            
            var c = 1
            for _ in 0..<k {
                c *= digit
            }
            
            newN += c
        }
        
        return newN == N
    }
    
    func test() -> Void {
        print(isArmstrong(153))
        print(isArmstrong(123))
    }
}
