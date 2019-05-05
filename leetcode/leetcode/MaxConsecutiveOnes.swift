//
//  MaxConsecutiveOnes.swift
//  leetcode
//
//  Created by Henry on 2019/5/6.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaxConsecutiveOnesSolution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var ret = 0
        var tmp = 0
        for n in nums {
            if n == 0 {
                ret = max(ret, tmp)
                tmp = 0
            } else {
                tmp += n
            }
        }
        ret = max(ret, tmp)
        
        return ret
    }
    
    func test() -> Void {
        print(findMaxConsecutiveOnes([1, 1, 0, 1, 1, 1]))
    }
}
