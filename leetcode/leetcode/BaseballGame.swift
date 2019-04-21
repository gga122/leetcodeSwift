//
//  BaseballGame.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BaseballGameSolution {
    func calPoints(_ ops: [String]) -> Int {
        var stack = [Int]()
        for c in ops {
            switch c {
            case "+":
                stack.append(stack[stack.count - 1] + stack[stack.count - 2])
            case "C":
                stack.popLast()
            case "D":
                stack.append(stack.last! * 2)
            default:
                stack.append(Int(c)!)
            }
        }
        
        return stack.reduce(0, { (tmpResult, element) -> Int in
            return tmpResult + element
        })
    }
    
    func test() -> Void {
        print(calPoints(["5", "2", "C", "D", "+"]))
        print(calPoints(["5", "-2", "4", "C", "D", "9", "+", "+"]))
    }
}
