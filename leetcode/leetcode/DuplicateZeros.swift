//
//  DuplicateZeros.swift
//  leetcode
//
//  Created by Henry on 2019/6/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DuplicateZerosSolution {
    func duplicateZeros(_ arr: inout [Int]) {
        var dup = arr
        var i = 0
        var j = 0
        while i < dup.count && j < arr.count {
            if dup[i] == 0 {
                arr[j] = 0
                if j+1 < arr.count {
                    arr[j+1] = 0
                }
                i+=1
                j+=2
            } else {
                arr[j] = dup[i]
                i+=1
                j+=1
            }
        }
    }
    
    func test() -> Void {
        var array1 = [1,0,2,3,0,4,5,0] // [1,0,0,2,3,0,0,4]
        duplicateZeros(&array1)
        print(array1)
        
        var array2 = [1,2,3]
        duplicateZeros(&array2)
        print(array2)
        
        var array3 = [0,0,0,0,0,0,0]
        duplicateZeros(&array3)
        print(array3)
    }
}
