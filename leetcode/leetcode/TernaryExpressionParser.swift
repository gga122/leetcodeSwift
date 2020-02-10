//
//  TernaryExpressionParser.swift
//  leetcode
//
//  Created by MickyZhu on 11/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class TernaryExpressionParserSolution {
    func parseTernary(_ expression: String) -> String {
        let chars = Array(expression)
        var stack = [Character]()
        
        var i = chars.count-1
        while i >= 0 {
            let c = chars[i]
            if c == "?" {
                let previous = chars[i-1]
                
                let trueRes = stack.removeLast()
                let falseRes = stack.removeLast()
                                
                if previous == "T" {
                    stack.append(trueRes)
                } else {
                    stack.append(falseRes)
                }
                
                i -= 2
            } else if c == ":" {
                i -= 1
            } else {
                stack.append(c)
                i -= 1
            }
        }
        
        if stack.isEmpty {
            return ""
        } else {
            return String(stack.removeLast())
        }
    }
    
    func test() -> Void {
        print(parseTernary("T?2:3"))
        print(parseTernary("F?1:T?4:5"))
        print(parseTernary("T?T?F:5:3"))
    }
}
