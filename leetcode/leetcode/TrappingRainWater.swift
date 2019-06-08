//
//  TrappingRainWater.swift
//  leetcode
//
//  Created by Henry on 2019/6/8.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TrappingRainWaterSolution {
    func trap(_ height: [Int]) -> Int {
        if height.count <= 1 {
            return 0
        }
        
        var height = height
        
        var res = 0
        var start = 0
        var end = height.count - 1
        while start < end {
            let left = height[start]
            if left == 0 {
                start += 1
                continue
            }
            
            let right = height[end]
            if right == 0 {
                end -= 1
                continue
            }
            
            /* 逐层计算可以接到的雨水 */
            let minValue = min(left, right)
            for i in start...end {
                if height[i] >= minValue {
                    height[i] -= minValue
                } else {
                    res += minValue - height[i]
                    height[i] = 0
                }
            }
            
            if left < right {
                start += 1
            } else {
                end -= 1
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
    }
}
