//
//  RemoveElement.swift
//  leetcode
//
//  Created by Henry on 2019/4/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RemoveElementSolution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var index = 0
        while index < nums.count {
            if nums[index] == val {
                nums.remove(at: index)
            } else {
                index += 1
            }
        }
        
        return nums.count
    }
    
    func test() -> Void {
        var array1 = [3, 2, 2, 3]
        print(removeElement(&array1, 3))
        var array2 = [0, 1, 2, 2, 3, 0, 4, 2]
        print(removeElement(&array2, 2))
    }
}
