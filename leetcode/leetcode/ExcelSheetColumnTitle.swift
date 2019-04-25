//
//  ExcelSheetColumnTitle.swift
//  leetcode
//
//  Created by Henry on 2019/4/25.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ExcelSheetColumnTitleSolution {
    func convertToTitle(_ n: Int) -> String {
        if n == 0 {
            return ""
        }
        
        var n = n
        var s = ""
        let d: Dictionary<Int, Character> = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G",
            8: "H", 9: "I", 10: "J", 11: "K", 12: "L", 13: "M", 14: "N", 15: "O", 16: "P", 17: "Q", 18: "R", 19: "S", 20: "T", 21: "U", 22: "V", 23: "W", 24: "X", 25: "Y", 26: "Z"]
        while n > 0 {
            var v = n % 26
            if v == 0 {
                v = 26
                n = (n - 1) / 26
            } else {
                n /= 26
            }
            let c = d[v]!
            s.insert(c, at: s.startIndex)
        }
        
        return s
    }
    
    func test() -> Void {
        print(convertToTitle(1))
        print(convertToTitle(28))
        print(convertToTitle(701))
        print(convertToTitle(52))
    }
}
