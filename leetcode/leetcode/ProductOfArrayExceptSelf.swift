//
//  ProductOfArrayExceptSelf.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ProductOfArrayExceptSelfSolution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var ret = nums
        
        var k = 1
        for i in 0..<nums.count {
            ret[i] = k
            k *= nums[i]
        }
        k = 1
        for i in (0..<nums.count).reversed() {
            ret[i] *= k
            k *= nums[i]
        }
        
        return ret
    }
    
    func test() -> Void {
        print(productExceptSelf([1,2,3,4]))
    }
}
