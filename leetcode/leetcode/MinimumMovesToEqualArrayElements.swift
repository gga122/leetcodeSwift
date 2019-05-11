//
//  MinimumMovesToEqualArrayElements.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinimumMovesToEqualArrayElementsSolution {
    func minMoves(_ nums: [Int]) -> Int {
        var ret = 0
        var min = Int.max
        for n in nums {
            if min > n {
                min = n
            }
        }
        for n in nums {
            ret += (n - min)
        }
        
        return ret
    }
    
    func test() -> Void {
        print(minMoves([1, 2, 3]))
    }
}
