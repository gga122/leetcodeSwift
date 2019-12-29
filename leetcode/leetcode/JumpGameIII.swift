//
//  JumpGameIII.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class JumpGameIIISolution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var indexes = Set<Int>.init()
        let res = backTrace(arr, &indexes, start)
        return res
    }
    
    func backTrace(_ arr: [Int], _ indexes: inout Set<Int>, _ current: Int) -> Bool {
        if current < 0 {
            return false
        } else if current >= arr.count {
            return false
        } else {
            if arr[current] == 0 {
                return true
            }
            
            if !indexes.insert(current).inserted {
                return false
            }
            let left = backTrace(arr, &indexes, current-arr[current])
            if left {
                return true
            }
            let right = backTrace(arr, &indexes, current+arr[current])
            if right {
                return true
            }
            return false
        }
    }
    
    func test() -> Void {
        print(canReach([4,2,3,0,3,1,2], 5))
        print(canReach([4,2,3,0,3,1,2], 0))
        print(canReach([3,0,2,1,2], 2))
    }
}
