//
//  LastStoneWeight.swift
//  leetcode
//
//  Created by Henry on 2020/1/10.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation
class LastStoneWeightSolution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        if stones.count == 1 {
            return stones[0]
        }
        if stones.count == 2 {
            return abs(stones[0]-stones[1])
        }
        
        var sorted = stones.sorted { (v1, v2) -> Bool in
            return v1 > v2
        }
        
        let a = sorted.removeFirst()
        let b = sorted.removeFirst()
        if a != b {
            sorted.append(a-b)
        }
        
        return lastStoneWeight(sorted)
    }
    
    func test() -> Void {
        print(lastStoneWeight([2,7,4,1,8,1]))
    }
}
