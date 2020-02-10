//
//  TwoSumLessThanK.swift
//  leetcode
//
//  Created by MickyZhu on 10/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class TwoSumLessThanKSolution {
    func twoSumLessThanK(_ A: [Int], _ K: Int) -> Int {
        if A.count < 2 {
            return -1
        }
        
        let sorted = A.sorted()

        if sorted[0] + sorted[1] > K {
            return -1
        }
            
        var begin = 0
        var end = sorted.count-1
        var res: Int? = nil
        while begin < end {
            let val = sorted[begin] + sorted[end]
            if val >= K {
                end -= 1
            } else {
                if res == nil {
                    res = val
                } else {
                    res = max(res!, val)
                }
                begin += 1
            }
        }
    
        return res ?? -1
    }
    
    func test() -> Void {
        print(twoSumLessThanK([34,23,1,24,75,33,54,8], 60))
        print(twoSumLessThanK([10,20,30], 15))
        print(twoSumLessThanK([254,914,110,900,147,441,209,122,571,942,136,350,160,127,178,839,201,386,462,45,735,467,153,415,875,282,204,534,639,994,284,320,865,468,1,838,275,370,295,574,309,268,415,385,786,62,359,78,854,944], 200))
    }
}
