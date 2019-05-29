//
//  GasStation.swift
//  leetcode
//
//  Created by Henry on 2019/5/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class GasStationSolution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var res = 0
        var run = 0
        var rest = 0
        for i in 0..<gas.count {
            run += gas[i] - cost[i]
            rest += gas[i] - cost[i]
            if run < 0 {
                res = i + 1
                run = 0
            }
        }
        
        return rest < 0 ? -1 : res
    }
    
    func test() -> Void {
        print(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))
        print(canCompleteCircuit([5,1,2,3,4], [4,4,1,5,1]))
        print(canCompleteCircuit([5,8,2,8], [6,5,6,6]))
        print(canCompleteCircuit([5], [4]))
        print(canCompleteCircuit([2], [2]))
    }
}
