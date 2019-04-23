//
//  CountAndSay.swift
//  leetcode
//
//  Created by Henry on 2019/4/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CountAndSaySolution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        
        var startString = "1"
        var currentString = ""
        var level = 1
        while level < n {
            startString.append("0")
            let chars = Array(startString)
            var cIndex = 0
            var count = 1
            while cIndex < chars.count - 1 {
                if chars[cIndex] == chars[cIndex + 1] {
                    count += 1
                } else {
                    currentString.append("\(count)")
                    currentString.append("\(chars[cIndex])")
                    count = 1
                }
                
                cIndex += 1
            }
            startString = currentString
            currentString.removeAll()
            
            level += 1
        }
        
        return startString
    }
    
    func test() -> Void {
        print(countAndSay(1))
        print(countAndSay(4))
    }
}
