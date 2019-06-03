//
//  FindTheDuplicateNumber.swift
//  leetcode
//
//  Created by Henry on 2019/6/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindTheDuplicateNumberSolution {
    func findDuplicate(_ nums: [Int]) -> Int {
        let length = nums.count
        if length > 1 {
            var slow = nums[0]
            var fast = nums[nums[0]]
            while fast != slow {
                slow = nums[slow]
                fast = nums[nums[fast]]
            }
            
            fast = 0
            while fast != slow {
                slow = nums[slow]
                fast = nums[fast]
            }
            
            return slow
        }
        return Int.max
    }
    
    func test() -> Void {
        print(findDuplicate([1,3,4,2,2]))
        print(findDuplicate([3,1,3,4,2]))
    }
}
