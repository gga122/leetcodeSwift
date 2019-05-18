//
//  CombinationSum.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CombinationSumSolution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.count == 0 {
            return []
        }
        
        var mutableCandidates = [Int]()
        for num in candidates {
            if num != 0 || num < target {
                mutableCandidates.append(num)
            }
        }
        mutableCandidates.sort()
        
        var ret = [[Int]]()
        backTracking(&ret, mutableCandidates, 0, [], target)
        
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ candidates: [Int], _ index: Int, _ tmp: [Int], _ distance: Int) -> Void {
        if distance < 0 {
            return
        } else if distance == 0 {
            result.append(tmp)
        } else {
            for i in index..<candidates.count {
                let n = candidates[i]
                if n <= distance {
                    var tmp = tmp
                    tmp.append(n)
                    backTracking(&result, candidates, i, tmp, distance - n)
                }
            }
        }
    }
    
    func test() -> Void {
        print(combinationSum([2,3,6,7], 7))
        print(combinationSum([2,3,5], 8))
        print(combinationSum([8,6,7,9], 5))
    }
}
