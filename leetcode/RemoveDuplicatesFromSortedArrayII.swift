//
//  RemoveDuplicatesFromSortedArrayII.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RemoveDuplicatesFromSortedArrayIISolution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 2 {
            return nums.count
        }
        
        var index = 1
        for i in 2..<nums.count {
            if nums[i] != nums[index-1] {
                index += 1
                nums[index] = nums[i]
            }
        }
        
        return index + 1
    }
    
    func test() -> Void {
        var a1 = [1,1,1,2,2,3]
        print(removeDuplicates(&a1))
        print(a1)
        
        var a2 = [0,0,1,1,1,1,2,3,3]
        print(removeDuplicates(&a2))
        print(a2)
    }
}
