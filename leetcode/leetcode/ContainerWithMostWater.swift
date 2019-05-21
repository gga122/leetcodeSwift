//
//  ContainerWithMostWater.swift
//  leetcode
//
//  Created by Henry on 2019/5/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ContainerWithMostWaterSolution {
    func maxArea(_ height: [Int]) -> Int {
        if height.count == 2 {
            return min(height[0], height[1])
        }
        
        var mostValue = 0
        var start = 0
        var end = height.count - 1
        while start < end {
            let value = min(height[start], height[end]) * (end - start)
            mostValue = max(mostValue, value)
            
            if height[start] > height[end] {
                end -= 1
            } else {
                start += 1
            }
        }

        return mostValue
    }
    
    func test() -> Void {
        print(maxArea([1,8,6,2,5,4,8,3,7]))
    }
}
