//
//  CombinationSumIII.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CombinationSumIIISolution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        if k == 0 || n == 0 {
            return []
        }
        
        var ret = [[Int]]()
        backTracking(&ret, [], n, 1, k)
        
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ tmp: [Int], _ distance: Int,  _ index: Int, _ count: Int) -> Void {
        if count == 0 {
            if distance == 0 {
                result.append(tmp)
            }
        } else {
            if index > 9 {
                return
            }
            if count == 1 && distance > 9 {
                return
            }

            for i in index...9 {
                var tmp = tmp
                tmp.append(i)
                backTracking(&result, tmp, distance - i, i + 1, count - 1)
            }
        }
    }
    
    func test() -> Void {
        print(combinationSum3(3, 7))
        print(combinationSum3(3, 9))
        print(combinationSum3(3, 15))
    }
}
