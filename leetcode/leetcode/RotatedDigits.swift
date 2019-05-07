//
//  RotatedDigits.swift
//  leetcode
//
//  Created by Henry on 2019/5/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RotatedDigitsSolution {
    func rotatedDigits(_ N: Int) -> Int {
        let validA = [0: 0,
                      1: 1,
                      8: 8];
        let validB = [2: 5,
                      5: 2,
                      6: 9,
                      9: 6];
        
        var nums = [Int]()
        for n in 1...N {
            var num = n
            var length = 0
            var hasValidB = false
            while num > 0 {
                let c = num % 10
                let resultA = validA[c];
                if resultA == nil {
                    let resultB = validB[c];
                    if resultB == nil {
                        break
                    } else {
                        hasValidB = true
                    }
                }
                
                num /= 10
                length += 1
            }
            
            if num == 0 && hasValidB {
                nums.append(n)
            }
        }
        
        return nums.count
    }
    
    func test() -> Void {
        print(rotatedDigits(10))
        print(rotatedDigits(857))
    }
}
