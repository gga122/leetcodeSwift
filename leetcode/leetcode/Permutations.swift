//
//  Permutations.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PermutationsSolution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count <= 1 {
            return [nums]
        }
        
        var ret = [[Int]]()
        backTracking(&ret, nums, 0)
        
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ nums: [Int], _ index: Int) -> Void {
        if index >= nums.count {
            result.append(nums)
        }
        
        var nums = nums
        for j in index..<nums.count {
            nums.swapAt(index, j)
            backTracking(&result, nums, index + 1)
            nums.swapAt(index, j)
        }
    }
    
    func test() -> Void {
        print(permute([1,2,3]))
    }
}
