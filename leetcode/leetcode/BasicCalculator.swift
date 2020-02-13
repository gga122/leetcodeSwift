//
//  BasicCalculator.swift
//  leetcode
//
//  Created by MickyZhu on 12/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class BasicCalculatorSolution {
    func calculate(_ s: String) -> Int {
        let chars = Array(s)
        
        var res = 0
        var operand = 0
        var stack = [Int]()
        var sign = 1 // 1 is positive, -1 is negative
        
        for i in 0..<chars.count {
            let c = chars[i]
            if c.isNumber {
                operand *= 10
                operand += c.wholeNumberValue!
            } else if c == "+" {
                res += sign * operand
                sign = 1
                operand = 0
            } else if c == "-" {
                res += sign * operand
                sign = -1
                operand = 0
            } else if c == "(" {
                stack.append(res)
                stack.append(sign)
                
                sign = 1
                res = 0
            } else if c == ")" {
                res += sign * operand
                
                res *= stack.removeLast()
                res += stack.removeLast()
                
                operand = 0
            }
        }
        
        return res + (sign * operand)
    }
    
    func compress(_ nums: inout [Int], _ tokens: inout [Character]) -> Void {
        while nums.count >= 2 && tokens.count >= 1 {
            let token = tokens.removeLast()
            let num1 = nums.removeLast()
            let num2 = nums.removeLast()
            
            if token == "+" {
                nums.append(num2+num1)
            } else if token == "-" {
                nums.append(num2-num1)
            }
            
        }
    }
    
    func test() -> Void {
        print(calculate("1 + 1"))
        print(calculate(" 2-1 + 2 "))
        print(calculate("(1+(4+5+2)-3)+(6+8)"))
    }
}
