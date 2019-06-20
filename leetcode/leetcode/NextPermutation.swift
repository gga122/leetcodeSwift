//
//  NextPermutation.swift
//  leetcode
//
//  Created by Henry on 2019/6/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NextPermutationSolution {
    func nextPermutation(_ nums: inout [Int]) {
        var index = Int.min
        for i in (1..<nums.count).reversed() {
            if nums[i-1] < nums[i] {
                index = i - 1
                break
            }
        }
        
        if index == Int.min {
            nums.reverse()
            return
        }
        
        for i in (index+1..<nums.count).reversed() {
            if nums[i] > nums[index] {
                nums.swapAt(i, index)
                break
            }
        }
        
        var start = index+1
        var end = nums.count-1
        while start < end {
            if nums[start] > nums[end] {
                nums.swapAt(start, end)
                start += 1
                end -= 1
            } else {
                break
            }
        }
    }
    
    func test() -> Void {
        var a0 = [1,2,3]
        nextPermutation(&a0)
        print(a0)
        
        var a1 = [3,2,1]
        nextPermutation(&a1)
        print(a1)
        
        var a2 = [1,1,5]
        nextPermutation(&a2)
        print(a2)
    }
}
