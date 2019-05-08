//
//  RelativeRanks.swift
//  leetcode
//
//  Created by Henry on 2019/5/9.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RelativeRanksSolution {
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        var hashs = [Int: Int]()
        var scores = nums
        scores.sort()
        var i = 0
        while i < scores.count {
            let score = scores[i]
            hashs[score] = scores.count - i
            i += 1
        }
        
        var ret = [String]()
        for n in nums {
            let rank = hashs[n]
            if rank == 1 {
                ret.append("Gold Medal")
            } else if rank == 2 {
                ret.append("Silver Medal")
            } else if rank == 3 {
                ret.append("Bronze Medal")
            } else {
                ret.append("\(rank!)")
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(findRelativeRanks([5, 4, 3, 2, 1]))
    }
}
