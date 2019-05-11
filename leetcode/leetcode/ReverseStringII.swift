//
//  ReverseStringII.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReverseStringIISolution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var chars = Array(s)
        var i = 0
        var start = 0
        var end = 0
        while i < chars.count {
            if chars.count - i <= k {
                start = i
                end = chars.count - 1
            } else {
                start = i
                end = i + k - 1
            }
            i += 2 * k
            while start < end {
                chars.swapAt(start, end)
                start += 1
                end -= 1
            }
        }
        
        return String(chars)
    }
    
    func test() -> Void {
        print(reverseStr("abcdefg", 2))
        print(reverseStr("abcdefg", 4))
        print(reverseStr("krmyfshbspcgtesxnnljhfursyissjnsocgdhgfxubewllxzqhpasguvlrxtkgatzfybprfmmfithphckksnvjkcvnsqgsgosfxc", 20))
        print(reverseStr("hyzqyljrnigxvdtneasepfahmtyhlohwxmkqcdfehybknvdmfrfvtbsovjbdhevlfxpdaovjgunjqlimjkfnqcqnajmebeddqsgl", 39))
    }
}
