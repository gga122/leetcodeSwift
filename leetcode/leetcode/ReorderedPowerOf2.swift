//
//  ReorderedPowerOf2.swift
//  leetcode
//
//  Created by MickyZhu on 2/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ReorderedPowerOf2Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        let target = getElements(N)
        
        var basic = 1
        for _ in 0..<32 {
            let elements = getElements(basic)
            
            var equal = true
            
            for j in 0..<10 {
                if target[j] != elements[j] {
                    equal = false
                    break
                }
            }
            
            if equal {
                return true
            }
            
            basic *= 2
        }
        
        return false
    }
    
    func getElements(_ num: Int) -> [Int] {
        var res = [Int].init(repeating: 0, count: 10)
                
        var num = num
        while num > 0 {
            let cur =  num % 10
            res[cur] += 1
            num /= 10
        }
        
        return res
    }
    
    func test() -> Void {
        print(reorderedPowerOf2(1))
        print(reorderedPowerOf2(10))
        print(reorderedPowerOf2(16))
        print(reorderedPowerOf2(24))
        print(reorderedPowerOf2(46))
    }
}
