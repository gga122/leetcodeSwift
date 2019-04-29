//
//  SortArrayByParity.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SortArrayByParitySolution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        if A.count <= 1 {
            return A
        }
        
        var oddNums = [Int]()
        var evenNums = [Int]()
        for a in A {
            if a % 2 == 0 {
                evenNums.append(a)
            } else {
                oddNums.append(a)
            }
        }
        
        return evenNums + oddNums
    }
    
    func test() -> Void {
        print(sortArrayByParity([3, 1, 2, 4]))
    }
}
