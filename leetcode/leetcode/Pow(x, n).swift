//
//  Pow(x, n).swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class Pow_x_n_Solution {
    
    var hashs = [Int: Double]()
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0 {
            return 0
        }
        if x == 1 {
            return 1
        }
        if n == 0 {
            return 1
        }
        if n == 1 {
            return x
        }
        if n == -1 {
            return 1 / x
        }
        
        let left = n / 2
        let right = n - left
        
        var leftPart = hashs[left]
        if leftPart == nil {
            leftPart = myPow(x, left)
            hashs[left] = leftPart
        }
        
        var rightPart = hashs[right]
        if rightPart == nil {
            rightPart = myPow(x, right)
            hashs[right] = rightPart
        }
        
        return rightPart! * leftPart!
    }
    
    func test() -> Void {
        print(myPow(2.00000, 10))
        print(myPow(2.10000, 3))
        print(myPow(2.00000, -2))
    }
}
