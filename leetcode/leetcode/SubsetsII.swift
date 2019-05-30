//
//  SubsetsII.swift
//  leetcode
//
//  Created by Henry on 2019/5/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SubsetsIISolution {
    
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        if nums.count <= 1 {
            return [nums, []]
        }
        
        var nums = nums
        nums.sort()
        var ret = [[Int]]()
        var tmp = [Int]()
        ret.append(tmp)
        helper(&ret, nums, &tmp, 0)

        return ret
    }
    
    func helper(_ result: inout [[Int]], _ nums: [Int], _ tmp : inout [Int], _ index: Int) -> Void {
        if index == nums.count {
            return
        }
        
        for i in index..<nums.count {
            if i > index && nums[i] == nums[i-1] {
                continue
            }
            
            tmp.append(nums[i])
            result.append(tmp)
            helper(&result, nums, &tmp, i+1)
            tmp.removeLast()
        }
    }
    
    func test() -> Void {
        print(subsetsWithDup([1,2,2]))
        print(subsetsWithDup([4,4,4,1,4]))
    }
}
