//
//  Base7.swift
//  leetcode
//
//  Created by Henry on 2019/4/16.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class Base7Solution {
    func convertToBase7(_ num: Int) -> String {
        let isNegative = num < 0

        var num = abs(num)
        var s = String.init()
        repeat {
            let n = num % 7
            num = num / 7
            let c = "\(n)"
            s.append(c)
        } while num > 0
        
        if isNegative {
            s.append("-")
        }
        
        s = String.init(s.reversed())
        return s
    }
    
    func test() -> Void {
        print(convertToBase7(100))
        print(convertToBase7(-7))
    }
}
