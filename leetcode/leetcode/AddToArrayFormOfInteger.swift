//
//  AddToArrayFormOfInteger.swift
//  leetcode
//
//  Created by Henry on 2019/4/17.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AddToArrayFormOfIntegerSolution {
    func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        var result = Array<Int>.init()
        
        var num = K
        var idx = A.count - 1
        while idx >= 0 {
            num = A[idx] + num
            let v = num % 10
            result.append(v)
            num = num / 10
            idx -= 1
        }
        
        while num > 0 {
            let v = num % 10
            result.append(v)
            num = num / 10
        }
        
        result = result.reversed()
        return result
    }
    
    func test() -> Void {
        print(addToArrayForm([1, 2, 0, 0], 34))
        print(addToArrayForm([2, 7, 4], 181))
        print(addToArrayForm([2, 1, 5], 806))
        print(addToArrayForm([9, 9, 9, 9, 9, 9, 9, 9, 9, 9], 1))
    }
}
