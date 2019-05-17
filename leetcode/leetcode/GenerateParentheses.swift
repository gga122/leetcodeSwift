//
//  GenerateParentheses.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class GenerateParenthesesSolution {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return []
        }
        
        var ret = [String]()
        backtracking(&ret, "", 0, 0, n)
        return ret
    }
    
    func backtracking(_ result: inout [String], _ tmp: String, _ leftCount: Int, _ rightCount: Int, _ max: Int) -> Void {
        if leftCount > max || rightCount > max {
            return
        }

        if leftCount == max && rightCount == max {
            result.append(tmp)
        }
        
        if leftCount >= rightCount {
            backtracking(&result, tmp + "(", leftCount + 1, rightCount, max)
            backtracking(&result, tmp + ")", leftCount, rightCount + 1, max)
        }
    }
    
    func test() -> Void {
        print(generateParenthesis(3))
    }
}
