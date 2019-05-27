//
//  IntegerToRoman.swift
//  leetcode
//
//  Created by Henry on 2019/5/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class IntegerToRomanSolution {
    func intToRoman(_ num: Int) -> String {
        let table = [["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
                     ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
                     ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
                     ["", "M", "MM", "MMM"]]
        
        let digits = [1000, 100, 10, 1]
        var s = ""
        for i in 0..<digits.count {
            let v = num / digits[i] % 10;
            let c = table[digits.count-1-i][v]
            s += c
        }
        
        return s
    }
    
    func test() -> Void {
        print(intToRoman(3))
        print(intToRoman(4))
        print(intToRoman(9))
        print(intToRoman(58))
        print(intToRoman(1994))
    }
}
