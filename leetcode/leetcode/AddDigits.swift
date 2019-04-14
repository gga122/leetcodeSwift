//
//  AddDigits.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AddDigitsSolution {
    func addDigits(_ num: Int) -> Int {
        if num < 10 {
            return num
        }
        
        var r = 0
        var v = num
        repeat {
            r += v % 10
            v /= 10
        } while v > 0
        
        return addDigits(r)
    }
    
    func test() -> Void {
        print(addDigits(38))
    }
}
