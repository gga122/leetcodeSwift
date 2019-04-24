//
//  ExcelSheetColumnNumber.swift
//  leetcode
//
//  Created by Henry on 2019/4/25.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ExcelSheetColumnNumberSolution {
    func titleToNumber(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let chars = Array(s)
        var number = 0
        var i = chars.count - 1
        let A: Character = "A"
        while i >= 0 {
            var v = A.unicodeScalars.first!.value.distance(to: chars[i].unicodeScalars.first!.value) + 1
            var u = chars.count - 1 - i
            while u > 0 {
                v *= 26
                u -= 1
            }
            number += v
            
            i -= 1
        }
        
        return number
    }
    
    func test() -> Void {
        print(titleToNumber("A"))
        print(titleToNumber("AB"))
        print(titleToNumber("ZY"))
    }
}
