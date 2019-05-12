//
//  LongestHarmoniousSubsequence.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestHarmoniousSubsequenceSolution {
    func findLHS(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return 0
        }
        
        var hashs = [Int: Int]()
        for n in nums {
            if let count = hashs[n] {
                hashs[n] = 1 + count
            } else {
                hashs[n] = 1
            }
        }
        
        if hashs.count == 1 {
            return 0
        }
        var keys = [Int]()
        for (k, _) in hashs {
            keys.append(k)
        }
        keys.sort()
        
        var sum = 0
        for key in keys {
            let count = hashs[key]!
            if let peaceCount = hashs[key + 1] {
                sum = max(sum, count + peaceCount)
            }
        }
        if sum <= 1 {
            sum = 0
        }
        
        return sum
    }
    
    func test() -> Void {
        print(findLHS([1,3,2,2,5,2,3,7]))
        print(findLHS([1,3,5,7,9,11,13,15,17]))
        print(findLHS([1,4,1,3,1,-14,1,-13]))
    }
}
