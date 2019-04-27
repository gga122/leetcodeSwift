//
//  MissingNumber.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MissingNumberSolution {
    func missingNumber(_ nums: [Int]) -> Int {
        var total = (nums.count + 1) * nums.count / 2
        for n in nums {
            total -= n
        }
        return total
    }
    
    func test() -> Void {
        print(missingNumber([3, 0, 1]))
        print(missingNumber([9, 6, 4, 2, 3, 5, 7, 0, 1]))
    }
}
