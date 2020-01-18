//
//  WiggleSort.swift
//  leetcode
//
//  Created by Henry on 2020/1/18.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class WiggleSortSolution {
    func wiggleSort(_ nums: inout [Int]) {
        nums.sort()
        
        var i = 1
        while i < nums.count {
            if i+1 < nums.count {
                nums.swapAt(i, i+1)
            }
            i += 2
        }
    }
    
    func test() -> Void {
        var array1 = [3,5,2,1,6,4]
        wiggleSort(&array1)
        print(array1)
    }
}
