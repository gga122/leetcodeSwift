//
//  N-RepeatedElementInSize2NArray.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class N_RepeatedElementInSize2NArraySolution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        var set = Set<Int>.init()
        for n in A {
            if set.contains(n) {
                return n
            } else {
                set.insert(n)
            }
        }
        
        return NSNotFound
    }
    
    func test() -> Void {
        print(repeatedNTimes([1, 2, 3, 3]))
        print(repeatedNTimes([2, 1, 2, 5, 3, 2]))
        print(repeatedNTimes([5, 1, 5, 2, 5, 3, 5, 4]))
    }
}
