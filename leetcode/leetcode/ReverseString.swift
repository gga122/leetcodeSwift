//
//  ReverseString.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReverseStringSolution {
    func reverseString(_ s: inout [Character]) {
        if s.count <= 1 {
            return
        }
        
        var c: Character? = nil
        var i = 0
        while i < s.count / 2 {
            c = s[i]
            s[i] = s[s.count - 1 - i]
            s[s.count - 1 - i] = c!
            
            i += 1
        }
    }
    
    func test() -> Void {
        var chars1: [Character] = ["h", "e", "l", "l", "o"]
        reverseString(&chars1)
        print(chars1)
    }
}
