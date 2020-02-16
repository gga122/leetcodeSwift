//
//  BasicCalculatorII.swift
//  leetcode
//
//  Created by MickyZhu on 13/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class BasicCalculatorIISolution {
        
    func calculate(_ s: String) -> Int {
        var chars = Array(s)
        /* make sure all expression are end with '+0' */
        chars.append("+")
        chars.append("0")
                
        var operand = 0
        var components = [Int]()
        var mOperator = 0
        var mSign = 0 // 1 is multiplication, -1 is division
        var sign = 1 // 1 is positive, -1 is negative
        
        for i in 0..<chars.count {
            let c = chars[i]

            if c.isNumber {
                operand *= 10
                operand += c.wholeNumberValue!
            } else if c == "+" {
                if mSign != 0 {
                    if mSign == 1 {
                        mOperator *= operand
                    } else if mSign == -1 {
                        mOperator /= operand
                    }
                    
                    components.append(mOperator)
                    mSign = 0
                } else {
                    components.append(operand*sign)
                }
                
                operand = 0
                sign = 1
            } else if c == "-" {
                if mSign != 0 {
                    if mSign == 1 {
                        mOperator *= operand
                    } else if mSign == -1 {
                        mOperator /= operand
                    }
                    
                    components.append(mOperator)
                    mSign = 0
                } else {
                    components.append(operand*sign)
                }
                
                operand = 0
                sign = -1
            } else if c == "*" {
                if mSign != 0 {
                    if mSign == 1 {
                        mOperator *= operand*sign
                    } else if mSign == -1 {
                        mOperator /= operand*sign
                    }
                } else {
                    mOperator = operand*sign
                }
                
                operand = 0
                sign = 1
                mSign = 1
            } else if c == "/" {
                if mSign != 0 {
                    if mSign == 1 {
                        mOperator *= operand*sign
                    } else if mSign == -1 {
                        mOperator /= operand*sign
                    }
                } else {
                    mOperator = operand*sign
                }
                    
                operand = 0
                sign = 1
                mSign = -1
            }
        }
                
        var res = 0
        res = components.reduce(0, +)
        
        return res
    }
    
    func test() -> Void {
        print(calculate("876-142-978*2/8+4/2*2+40*2+282/2-137+855"))
        print(calculate("2*3*4"))
        print(calculate("12-3*4"))
        print(calculate("1"))
        print(calculate("3+2*2"))
        print(calculate(" 3/2 "))
        print(calculate(" 3+5 / 2 "))
    }
}
