//
//  SelfDividingNumbers.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SelfDividingNumbersSolution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var left = left
        
        var ret = [Int]()
        while left <= right {
            var current = left
            while current > 0 {
                let v = current % 10
                if v == 0 {
                    break
                }
                if left % v != 0 {
                    break
                }
                current /= 10
            }
            
            if current == 0 {
                ret.append(left)
            }
            left += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(selfDividingNumbers(1, 22))
    }
}
