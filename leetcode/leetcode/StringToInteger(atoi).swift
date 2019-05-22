//
//  StringToInteger(atoi).swift
//  leetcode
//
//  Created by Henry on 2019/5/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class StringToIntegerSolution {
    func myAtoi(_ str: String) -> Int {
        if str.count == 0 {
            return 0
        }
        
        var ret = 0
        var isNegative = 0
        var didStart = false
        for c in str {
            if c >= "0" && c <= "9" {
                ret *= 10
                let v = Int(c.unicodeScalars.first!.value) - 48
                ret += v
                didStart = true
            } else if c == " " {
                /* skip the space character before found the first valid character */
                if didStart {
                    break
                }
            } else if c == "-" {
                if !didStart && isNegative == 0 {
                    isNegative = -1
                    didStart = true
                } else {
                    break
                }
            } else if c == "+" {
                if !didStart && isNegative == 0 {
                    isNegative = 1
                    didStart = true
                } else {
                    break
                }
            } else {
                break
            }
            
            if ret > Int(Int32.max) {
                break
            }
        }
        
        if isNegative < 0 {
            ret.negate()
            ret = max(ret, Int(Int32.min))
        } else {
            ret = min(Int(Int32.max), ret)
        }
        
        return ret
    }
    
    func test() -> Void {
        print(myAtoi("42"))
        print(myAtoi("   -42"))
        print(myAtoi("4193 with words"))
        print(myAtoi("words and 987"))
        print(myAtoi("-91283472332"))
        print(myAtoi("20000000000000000000"))
        print(myAtoi("+1"))
        print(myAtoi("+-2"))
        print(myAtoi(" +0 123"))
    }
}
