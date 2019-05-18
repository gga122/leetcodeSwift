//
//  MinimumAddToMakeParenthesesValid.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinimumAddToMakeParenthesesValidSolution {
    func minAddToMakeValid(_ S: String) -> Int {
        if S.count == 0 {
            return 0
        }
        
        var stack = [Character]()
        var ret = 0
        for c in S {
            if c == ")" {
                if stack.isEmpty {
                    ret += 1
                } else {
                    stack.removeLast()
                }
            } else {
                stack.append("(")
            }
        }
        
        return ret + stack.count
    }
    
    func test() -> Void {
        print(minAddToMakeValid("())"))
        print(minAddToMakeValid("((("))
        print(minAddToMakeValid("()"))
        print(minAddToMakeValid("()))(("))
    }
}
