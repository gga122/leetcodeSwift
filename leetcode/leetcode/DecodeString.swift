//
//  DecodeString.swift
//  leetcode
//
//  Created by Henry on 2019/6/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DecodeStringSolution {
    func decodeString(_ s: String) -> String {
        if s.count == 0 {
            return s
        }
        
        let chars = Array(s)
        var components = [String]()
        var countStack = [Int]()
        var elementStack = [String]()
        var currentStr = ""
        var countString = ""
        for i in 0..<chars.count {
            let c = chars[i]
            if c == "[" {
                let countValue = Int(countString)!
                countStack.append(countValue)
                countString = ""
                elementStack.append(currentStr)
                currentStr = ""
                continue
            }
            if c == "]" {
                let count = countStack.removeLast()
                var tmp = ""
                for _ in 0..<count {
                    tmp += currentStr
                }
                if !elementStack.isEmpty {
                    currentStr = elementStack.removeLast() + tmp
                } else {
                    components.append(tmp)
                    currentStr = ""
                }
                continue
            }
            if c < "0" || c > "9" {
                currentStr += String(c)
            } else {
                countString += String(c)
            }
        }
        if currentStr != "" {
            components.append(currentStr)
        }
        
        return components.joined(separator: "")
    }
    
    func test() -> Void {
        print(decodeString("3[a]2[bc]"))
        print(decodeString("3[a2[c]]"))
        print(decodeString("2[abc]3[cd]ef"))
        print(decodeString("100[leetcode]"))
        print(decodeString("3[a]2[b4[F]c]"))
        print(decodeString("sd2[f2[e]g]i"))
    }
}
