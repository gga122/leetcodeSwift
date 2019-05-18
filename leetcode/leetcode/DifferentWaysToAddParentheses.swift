//
//  DifferentWaysToAddParentheses.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DifferentWaysToAddParenthesesSolution {
    
    func diffWaysToCompute(_ input: String) -> [Int] {
        let sarr = Array(input)
        var res = [Int]()
        for i in 0..<sarr.count {
            let c = sarr[i]
            if c == "+" || c == "-" || c == "*" {
                let resLeft = diffWaysToCompute(String(sarr[0..<i]))
                let resRight = diffWaysToCompute(String(sarr[i+1..<sarr.count]))
                for r1 in resLeft {
                    for r2 in resRight {
                        if c == "+" {
                            res.append(r1 + r2)
                        } else if c == "-" {
                            res.append(r1 - r2)
                        } else if c == "*" {
                            res.append(r1 * r2)
                        }
                    }
                }
            }
        }
        if res.isEmpty {
            res.append(Int(input)!)
        }
        return res
    }
    
    func test() -> Void {
        print(diffWaysToCompute("2-1-1"))
        print(diffWaysToCompute("2*3-4*5"))
    }
}
