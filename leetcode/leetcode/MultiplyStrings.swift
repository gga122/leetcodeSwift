//
//  MultiplyStrings.swift
//  leetcode
//
//  Created by Henry on 2019/6/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MultiplyStringsSolution {
    func multiply(_ num1: String, _ num2: String) -> String {
        var chars1 = Array(num1)
        var chars2 = Array(num2)
        if chars1.count == 1 {
            if chars1[0] == "0" {
                return "0"
            } else if chars1[0] == "1" {
                return num2
            }
        }
        if chars2.count == 1 {
            if chars2[0] == "0" {
                return "0"
            } else if chars2[0] == "1" {
                return num1
            }
        }
        
        if chars1.count < chars2.count {
            let tmp = chars1
            chars1 = chars2
            chars2 = tmp
        }

        chars1 = chars1.reversed()
        chars2 = chars2.reversed()
        
        let maxColumnLength = chars1.count + chars2.count + 1
        let maxRowLength = chars2.count
        var tmp = [[Int]].init(repeating: [Int].init(repeating: 0, count: maxColumnLength), count: maxRowLength)
        for i in 0..<chars2.count {
            var carry = 0
            let c1 = chars2[i]
            for j in 0..<chars1.count {
                let c2 = chars1[j]
                let v = charMultiple(c1, c2, carry)
                carry = v.carry
                tmp[i][i+j] += v.remain
            }
            if carry != 0 {
                tmp[i][i+chars1.count] = carry
            }
        }
        
        var res = [Int].init(repeating: 0, count: maxColumnLength)
        for i in 0..<maxColumnLength {
            for j in 0..<tmp.count {
                let v = res[i] + tmp[j][i]
                if v > 9 {
                    res[i] = v % 10
                    res[i+1] += v / 10
                } else {
                    res[i] = v
                }
            }
        }
        
        var ret = ""
        var skipHeadZero = true
        for i in (0..<res.count).reversed() {
            if res[i] == 0 && skipHeadZero {
                continue
            } else {
                let c = "\(res[i])"
                ret += c
                skipHeadZero = false
            }
        }
        
        return ret
    }
    
    func charMultiple(_ char1: Character, _ char2: Character, _ carry: Int) -> (carry: Int, remain: Int) {
        let v1 = Int(char1.unicodeScalars.first!.value) - 48
        let v2 = Int(char2.unicodeScalars.first!.value) - 48
        
        let v = v1 * v2 + carry
        return (v / 10, v % 10)
    }
    
    func test() -> Void {
        print(multiply("2", "3"))
        print(multiply("123", "456"))
    }
}
