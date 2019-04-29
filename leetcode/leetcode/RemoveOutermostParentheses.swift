//
//  RemoveOutermostParentheses.swift
//  leetcode
//
//  Created by Henry on 2019/4/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RemoveOutermostParenthesesSolution {
    func removeOuterParentheses(_ S: String) -> String {
        if S.count == 0 {
            return S
        }
        
        var chars = Array(S)
        var i = 0
        var indexes = [Int]()
        var stack = [Character]()
        while i < chars.count {
            let c = chars[i]
            switch c {
            case "(":
                stack.append(c)
                if stack.count == 1 {
                    indexes.append(i)
                }
                break
            case ")":
                stack.removeLast()
                if stack.count == 0 {
                    indexes.append(i)
                }
                break
            default: break
            }
            
            i += 1
        }
        
        i = indexes.count - 1
        while i >= 0 {
            let index = indexes[i]
            chars.remove(at: index)
            i -= 1
        }
        
        let ret = String(chars)
        return ret
    }
    
    func test() -> Void {
        print(removeOuterParentheses("(()())(())"))
        print(removeOuterParentheses("(()())(())(()(()))"))
    }
}
