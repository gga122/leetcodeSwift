//
//  NextGreaterElementIII.swift
//  leetcode
//
//  Created by Henry on 2019/6/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NextGreaterElementIIISolution {
    func nextGreaterElement(_ n: Int) -> Int {
        var chars = Array("\(n)")
        
        /* find the first decreasing element */
        var i = chars.count - 1
        while i - 1 >= 0 {
            if chars[i-1] < chars[i] {
                break
            }
            i -= 1
        }
        if i == 0 {
            return -1
        }
    
        /* find the min greater element and swap */
        let pivot = chars[i-1]
        var j = chars.count - 1
        while j > i {
            if chars[j] > pivot {
                break
            }
            j -= 1
        }
        chars.swapAt(i-1, j)
        
        /* sort the right part as the increase part */
        let partLeft = chars[0..<i]
        var partRight = chars[i..<chars.count]
        partRight.sort()
        chars = Array(partLeft) + Array(partRight)
        let v = Int(String(chars))!
        
        return v > INT32_MAX ? -1 : v
    }
    
    func test() -> Void {
        print(nextGreaterElement(12))
        print(nextGreaterElement(21))
        print(nextGreaterElement(230241))
        print(nextGreaterElement(1999999999))
    }
}
