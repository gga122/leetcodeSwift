//
//  LongestValidParentheses.swift
//  leetcode
//
//  Created by Henry on 2019/6/9.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestValidParenthesesSolution {
    func longestValidParentheses(_ s: String) -> Int {
        let chars = Array(s)
        if chars.count <= 1 {
            return 0
        }
        
        var maxValue = 0
        var dp = [Int].init(repeating: 0, count: chars.count)
        for i in 1..<chars.count {
            if chars[i] == ")" {
                if chars[i-1] == "(" {
                    dp[i] = (i>=2 ? dp[i-2] : 0) + 2
                } else if i - dp[i-1] > 0 && chars[i-dp[i-1]-1] == "(" {
                    dp[i] = dp[i-1] + ((i-dp[i-1]) >= 2 ? dp[i-dp[i-1]-2] : 0) + 2
                }
                
                maxValue = max(maxValue, dp[i])
            }
        }
        
        return maxValue
    }
    
    func test() -> Void {
        print(longestValidParentheses("())"))
        print(longestValidParentheses(")()())"))
    }
}
