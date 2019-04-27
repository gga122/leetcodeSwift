//
//  ContainsDuplicate.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ContainsDuplicateSolution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count <= 1 {
            return false
        }
        
        var set = Set<Int>.init()
        for n in nums {
            if set.contains(n) {
                return true
            } else {
                set.insert(n)
            }
        }
        
        return false
    }
    
    func test() -> Void {
        print(containsDuplicate([1, 2, 3, 1]))
        print(containsDuplicate([1, 2, 3, 4]))
        print(containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]))
    }
}
