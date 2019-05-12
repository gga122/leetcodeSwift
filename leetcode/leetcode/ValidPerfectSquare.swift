//
//  ValidPerfectSquare.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ValidPerfectSquareSolution {
    func isPerfectSquare(_ num: Int) -> Bool {
        if num < 0 {
            return false
        }
        if num <= 1 {
            return true
        }
        
        var start = 0
        var end = num / 2
        while start <= end {
            let mid = (end - start) / 2 + start
            let v = mid * mid
            if v == num {
                return true
            } else if v < num {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(isPerfectSquare(16))
        print(isPerfectSquare(14))
        print(isPerfectSquare(4))
    }
}
