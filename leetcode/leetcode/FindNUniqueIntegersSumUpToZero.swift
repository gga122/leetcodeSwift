//
//  FindNUniqueIntegersSumUpToZero.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindNUniqueIntegersSumUpToZeroSolution {
    func sumZero(_ n: Int) -> [Int] {
        var result = [Int]()
        
        for i in (1..<(n/2)+1).reversed() {
            result.append(-i)
        }
        if n % 2 != 0 {
            result.append(0)
        }
        
        for i in 1..<(n/2)+1 {
            result.append(i)
        }
        
        return result
    }
    
    func test() -> Void {
        print(sumZero(5))
        print(sumZero(3))
        print(sumZero(1))
        print(sumZero(6))
    }
}

