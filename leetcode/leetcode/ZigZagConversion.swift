//
//  ZigZagConversion.swift
//  leetcode
//
//  Created by Henry on 2019/6/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ZigZagConversionSolution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if s.count <= numRows {
            return s
        }
        if numRows == 1 {
            return s
        }
        
        var res = [Character]()
        let chars = Array(s)
        for i in 0..<numRows {
            var j = i
            while j < chars.count {
                res.append(chars[j])
                j += 2*numRows-2-2*i
                if j < chars.count && i != numRows - 1 && i != 0 {
                    res.append(chars[j])
                }
                j += 2*i
            }
        }
        
        let ret = String(res)
        return ret
    }
    
    func test() -> Void {
        print(convert("LEETCODEISHIRING", 3))
        print(convert("AB", 1))
    }
}
