//
//  DegreeOfAnArray.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DegreeOfAnArraySolution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        var hashs = [Int: (Int, Int, Int)]()
        var index = 0
        for n in nums {
            if let tuple = hashs[n] {
                hashs[n] = (tuple.0, index, tuple.2 + 1)
            } else {
                hashs[n] = (index, index, 1)
            }
             index += 1
        }
    
        var max: (Int, Int, Int)? = nil
        for (_, v) in hashs {
            if max == nil {
                max = v
            } else {
                if v.2 > max!.2 {
                    max = v
                } else if v.2 == max!.2 {
                    if max!.1 - max!.0 > v.1 - v.0 {
                        max = v
                    }
                }
            }
        }
        
        return (max!.1 - max!.0 + 1)
    }
    
    func test() -> Void {
        print(findShortestSubArray([1, 2, 2, 3, 1]))
        print(findShortestSubArray([1, 2, 2, 3, 1, 4, 2]))
        print(findShortestSubArray([1, 2, 2, 1, 2, 1, 1, 1, 1, 2, 2, 2]))
    }
}
