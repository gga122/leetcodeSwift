//
//  ScoreOfParentheses.swift
//  leetcode
//
//  Created by Henry on 2019/6/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ScoreOfParenthesesSolution {
    func scoreOfParentheses(_ S: String) -> Int {
        let chars = Array(S)
        if chars.count == 0 {
            return 0
        }
        
        var current = 0
        var sum = 0
        for i in 0..<chars.count {
            let c = chars[i]
            if c == "(" {
                if current == 0 {
                    current += 1
                } else {
                    current *= 2
                }
            } else if c == ")" {
                if chars[i-1] == "(" {
                    sum += current
                }
                current /= 2
            }
        }
        
        return sum
    }
    
    func test() -> Void {
        print(scoreOfParentheses("(())"))
        print(scoreOfParentheses("()()"))
        print(scoreOfParentheses("(()(()))"))
        print(scoreOfParentheses("()()()"))
        print(scoreOfParentheses("()(())"))
        print(scoreOfParentheses("(()())"))
    }
}
