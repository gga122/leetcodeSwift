//
//  SortArrayByParityII.swift
//  leetcode
//
//  Created by Henry on 2019/5/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SortArrayByParityIISolution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var A = A
        var i = 0
        var j = 1
        while i < A.count - 1 {
            if (A[i] & 1) != 0 {
                while (A[j] & 1) != 0 {
                    j += 2
                }
                
                let tmp = A[i]
                A[i] = A[j]
                A[j] = tmp
            }
            
            i += 2
        }
        
        return A
    }
    
    func test() -> Void {
        print(sortArrayByParityII([4, 2, 5, 7]))
    }
}
