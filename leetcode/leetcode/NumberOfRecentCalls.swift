//
//  NumberOfRecentCalls.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NumberOfRecentCallsRecentCounter {
    
    var queue = [Int]()
    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
        queue.append(t)
        while t - queue.first! > 3000 {
            queue.removeFirst()
        }
        
        return queue.count
    }

}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
