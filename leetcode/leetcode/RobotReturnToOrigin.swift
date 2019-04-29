//
//  RobotReturnToOrigin.swift
//  leetcode
//
//  Created by Henry on 2019/4/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RobotReturnToOriginSolution {
    func judgeCircle(_ moves: String) -> Bool {
        var x = 0
        var y = 0
        
        for move in moves {
            switch move {
            case "U":
                x += 1
            case "D":
                x -= 1
            case "L":
                y -= 1
            case "R":
                y += 1
            default: break
            }
        }
        
        return x == 0 && y == 0
    }
    
    func test() -> Void {
        print(judgeCircle("UD"))
        print(judgeCircle("LL"))
    }
}
