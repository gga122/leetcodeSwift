//
//  ClimbingStairs.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ClimbingStairsSolution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        
        var a = 1
        var b = 2
        var tmp = 0
        
        for _ in 3...n {
            tmp = a + b
            a = b
            b = tmp
        }
        
        return tmp
    }
    
    func test() -> Void {
        print(climbStairs(2))
        print(climbStairs(3))
    }
}
