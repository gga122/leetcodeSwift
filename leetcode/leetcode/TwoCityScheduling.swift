//
//  TwoCityScheduling.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TwoCitySchedulingSolution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        if costs.count == 0 {
            return 0
        }
        
        var costs = costs
        costs.sort { (a: [Int], b: [Int]) -> Bool in
            let k1 = a[0] - b[0]
            let k2 = a[1] - b[1]
            return k1 < k2
        }
        
        var ret = 0
        let mid = costs.count / 2
        for i in 0..<mid {
            ret += costs[i][0]
        }
        for i in mid..<costs.count {
            ret += costs[i][1]
        }
        
        return ret
    }
    
    func test() -> Void {
        print(twoCitySchedCost([[10, 20], [30, 200], [400, 50], [30, 20]]))
    }
}
