//
//  EvaluateReversePolishNotation.swift
//  leetcode
//
//  Created by MickyZhu on 4/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class EvaluateReversePolishNotationSolution {
    func evalRPN(_ tokens: [String]) -> Int {
        var res = 0
        var stack = [Int]()
        let operators = Set<String>.init(arrayLiteral: "+", "-", "*", "/")
        
        for token in tokens {
            if !operators.contains(token) {
                if let val = Int(token) {
                    stack.append(val)
                }
            } else {
                if stack.count >= 2 {
                    let num1 = stack.removeLast()
                    let num2 = stack.removeLast()
                    
                    switch token {
                    case "+":
                        stack.append(num2+num1)
                    case "-":
                        stack.append(num2-num1)
                    case "*":
                        stack.append(num2*num1)
                    case "/":
                        stack.append(num2/num1)
                    default:
                        break
                    }
                } 
            }
        }
        
        if !stack.isEmpty {
            res = stack.removeLast()
        }
        
        return res
    }
    
    func test() -> Void {
        print(evalRPN(["2", "1", "+", "3", "*"]))
        print(evalRPN(["4","13","5","/","+"]))
    }
}
