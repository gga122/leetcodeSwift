//
//  RangeAdditionII.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RangeAdditionIISolution {
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        var minRange = [m, n]
        for op in ops {
            if  minRange[0] > op[0] {
                minRange[0] = op[0]
            }
            if minRange[1] > op[1] {
                minRange[1] = op[1]
            }
        }
        
        return minRange[0] * minRange[1]
    }
    
    func test() -> Void {
        print(maxCount(3, 3, [[2, 2], [3, 3]]))
    }
}
