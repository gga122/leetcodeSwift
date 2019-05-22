//
//  KthLargestElementInAnArray.swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class KthLargestElementInAnArraySolution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        let base = nums[0]
        var left = [Int]()
        var mid = [Int]()
        var right = [Int]()
        for num in nums {
            if num < base {
                left.append(num)
            } else if num > base {
                right.append(num)
            } else {
                mid.append(num)
            }
        }
        
        if k <= right.count {
            return findKthLargest(right, k)
        } else if k > right.count && k <= right.count + mid.count {
            return mid[0]
        } else {
            return findKthLargest(left, k - mid.count - right.count)
        }
    }
    
    func test() -> Void {
        print(findKthLargest([3,2,1,5,6,4], 2))
        print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))
        print(findKthLargest([2,1], 2))
        print(findKthLargest([99,99], 1))
        print(findKthLargest([-1,-1], 2))
        print(findKthLargest([7,6,5,4,3,2,1], 2))
    }
}
