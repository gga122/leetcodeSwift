//
//  ReverseWordsInAStringIII.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReverseWordsInAStringIIISolution {
    func reverseWords(_ s: String) -> String {
        if s.count <= 1{
            return s
        }
        
        var chars = Array(s)
        var i = 0
        var ret = ""
        var stack = [Character]()
        while i < chars.count {
            let c = chars[i]
            if c == " " {
                while !stack.isEmpty {
                    ret.append(stack.removeLast())
                }
                ret.append(c)
            } else {
                stack.append(c)
            }
            
            i += 1
        }

        while !stack.isEmpty {
            ret.append(stack.removeLast())
        }
        
        return ret
    }
    
    func test() -> Void {
        print(reverseWords("Let's take LeetCode contest"))
    }
}
