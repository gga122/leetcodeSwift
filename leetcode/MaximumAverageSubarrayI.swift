//
//  MaximumAverageSubarrayI.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximumAverageSubarrayISolution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        if k == 1 {
            let r = nums.reduce(Int.min) { (previous, cur) -> Int in
                return max(previous, cur)
            }
            return Double(r)
        }
        
        var sum = nums[0..<k].reduce(0, +)
        var maxVal = sum
        for i in k..<nums.count {
            sum += nums[i] - nums[i-k]
            maxVal = max(sum, maxVal)
        }
        
        return Double(maxVal)/Double(k)
    }
    
    func test() -> Void {
        print(findMaxAverage([1,12,-5,-6,50,3], 4))
    }
}
