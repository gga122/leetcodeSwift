//
//  Combinations.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CombinationsSolution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n == 0 {
            return []
        }
        if n == 1 {
            return [[n]]
        }
        
        var ret = [[Int]]()
        let remains = Array<Int>.init(sequence(first: 1, next: { (current) -> Int? in
            if current < n {
                return current + 1
            } else {
                return nil
            }
        }))
        backTracking(&ret, remains, [], k)
        
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ remains: [Int], _ nums: [Int], _ max: Int) -> Void {
        if nums.count == max {
            result.append(nums)
        } else {
            for i in 0..<remains.count {
                let v = remains[i]
                var nums = nums
                nums.append(v)
                let newRemain = Array(remains[(i+1)..<remains.count])
                backTracking(&result, newRemain, nums, max)
            }
        }
    }
    
    func test() -> Void {
        print(combine(4, 2))
    }
}
