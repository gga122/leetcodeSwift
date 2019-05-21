//
//  UTF_8Validation.swift
//  leetcode
//
//  Created by Henry on 2019/5/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UTF_8ValidationSolution {
    func validUtf8(_ data: [Int]) -> Bool {
        if data.count == 0 {
            return false
        }
        
        var extensionCount = 0
        let mask = 1 << 7
        for d in data {
            /* judge if extension part correct */
            if extensionCount != 0 {
                if (d & mask) != mask {
                    return false
                }
                extensionCount -= 1
            } else {
                if d >> 5 == 0b110 {
                    extensionCount = 1
                } else if d >> 4 == 0b1110 {
                    extensionCount = 2
                } else if d >> 3 == 0b11110 {
                    extensionCount = 3
                } else if d >> 7 != 0 {
                    return false
                }
            }
        }
        
        return extensionCount == 0
    }
    
    func test() -> Void {
        print(validUtf8([197, 130, 1]))
        print(validUtf8([235, 140, 4]))
        print(validUtf8([255]))
        print(validUtf8([240,162,138,147]))
        print(validUtf8([145]))
    }
}
