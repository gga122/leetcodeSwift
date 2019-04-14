//
//  ValidParentheses.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ValidParenthesesSolution {
    func isValid(_ s: String) -> Bool {
        let dic: Dictionary<Character, Character> = ["[": "]", "{": "}", "(": ")"]
        var stack = Array<Character>.init()
        for c in s {
            if stack.count == 0 {
                if c == "]" || c == "}" || c == ")" {
                    return false
                }
                stack.append(c)
            } else {
                if c == "[" || c == "{" || c == "(" {
                    stack.append(c)
                } else {
                    let top = stack.last
                    if c == dic[top!] {
                        stack.removeLast()
                    } else {
                        return false
                    }
                }
            }
        }
        
        return stack.count == 0
    }
    
    func test() -> Void {
        print(isValid("()"))
        print(isValid("()[]{}"))
        print(isValid("(]"))
        print(isValid("([)]"))
        print(isValid("{[]}"))
    }
}
