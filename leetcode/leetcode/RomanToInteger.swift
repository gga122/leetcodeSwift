//
//  RomanToInteger.swift
//  leetcode
//
//  Created by Henry on 2019/4/14.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RomanToIntegerSolution {
    /*
    I             1
    V             5
    X             10
    L             50
    C             100
    D             500
    M             1000
    */
    func romanToInt(_ s: String) -> Int {
        let dic: Dictionary<Character, Int> = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        var result = 0
        var index = 0;
        for aChar in s {
            let v = dic[aChar]
            var rv = 0
            if index + 1 <= s.count - 1 {
                let k = s.index(s.startIndex, offsetBy: index + 1)
                let c = s[k]
                rv = dic[c]!
            }
            if v! >= rv {
                result += v!
            } else {
                result -= v!
            }
            
            index += 1
        }
        
        return result
    }
    
    func test() -> Void {
        print(romanToInt("III"))
        print(romanToInt("IV"))
        print(romanToInt("IX"))
        print(romanToInt("LVIII"))
        print(romanToInt("MCMXCIV"))
    }
}
