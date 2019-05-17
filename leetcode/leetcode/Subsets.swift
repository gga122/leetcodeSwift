//
//  Subsets.swift
//  leetcode
//
//  Created by Henry on 2019/5/17.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SubsetsSolution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count <= 1 {
            return [nums, []]
        }
        
        var ret = [[Int]]()
        ret += backtracking(nums: nums, [], 0)
        ret.append([])
        
        return ret
    }

    func backtracking(nums: [Int], _ tmp :[Int], _ k: Int) -> [[Int]] {
        var ret = [[Int]]()
        var k = k
        while k < nums.count {
            var result = tmp
            result.append(nums[k])
            ret.append(result)
            ret += backtracking(nums: nums, result, k + 1)
            k += 1
        }
        return ret
    }
    
    func test() -> Void {
        print(subsets([1,2,3]))
    }
}
