//
//  CombinationSumII.swift
//  leetcode
//
//  Created by Henry on 2019/5/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CombinationSumIISolution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.count == 0 {
            return []
        }
        
        var subCandidates = [Int]()
        for num in candidates {
            if num > target {
                continue
            }
            subCandidates.append(num)
        }
        subCandidates.sort()
        var ret = [[Int]]()
        var tmp = [Int]()
        backTracking(&ret, subCandidates, 0, target, &tmp)
        
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ candidates: [Int], _ index: Int, _ target: Int, _ tmp: inout [Int]) -> Void {
        if target == 0 {
            result.append(tmp)
        } else {
            for i in index..<candidates.count {
                let num = candidates[i]
                if num > target {
                    return
                } else if i > index && num == candidates[i-1] {
                    continue
                }
                
                tmp.append(num)
                backTracking(&result, candidates, i + 1, target - num, &tmp)
                tmp.removeLast()
            }
        }
    }
    
    func test() -> Void {
        print(combinationSum2([10,1,2,7,6,1,5], 8))
        print(combinationSum2([2,5,2,1,2], 5))
    }
}
