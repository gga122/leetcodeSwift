//
//  SortTransformedArray.swift
//  leetcode
//
//  Created by MickyZhu on 6/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class SortTransformedArraySolution {
    func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
        var res = [Int]()
        
        if a == 0 {
            for n in nums {
                let v = b * n + c
                res.append(v)
            }
            
            if b < 0 {
                res.reverse()
            }
        } else {
            var start = 0
            var end = nums.count - 1
            let k = Double(-b) / Double((2 * a))
                        
            func calc(_ n: Int) -> Int {
                return a * n * n + b * n + c
            }
            
            while start <= end {
                let s = abs(Double(nums[start]) - k)
                let e = abs(Double(nums[end]) - k)
                
                if s > e {
                    res.append(calc(nums[start]))
                    start += 1
                } else {
                    res.append(calc(nums[end]))
                    end -= 1
                }
            }
            
            if a > 0 {
                res.reverse()
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(sortTransformedArray([-4,-2,2,4], 1, 3, 5))
        print(sortTransformedArray([-4,-2,2,4], -1, 3, 5))
        print(sortTransformedArray([-4,-2,2,4], 0, -1, 5))
    }
}
