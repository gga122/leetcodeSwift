//
//  StrobogrammaticNumber.swift
//  leetcode
//
//  Created by Henry on 2019/6/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class StrobogrammaticNumberSolution {
    func isStrobogrammatic(_ num: String) -> Bool {
        let chars = Array(num)
        if chars.count == 1 {
            return chars[0] == "0" || chars[0] == "1" || chars[0] == "8"
        }
        
        let hashs: [Character: Character] = ["0": "0",
                                             "1": "1",
                                             "6": "9",
                                             "8": "8",
                                             "9": "6"]
        
        for i in 0...chars.count/2 {
            if chars[i] != hashs[chars[chars.count-i-1]] {
                return false
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(isStrobogrammatic("69"))
        print(isStrobogrammatic("88"))
        print(isStrobogrammatic("962"))
    }
}
