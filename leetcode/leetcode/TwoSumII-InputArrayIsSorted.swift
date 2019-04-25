//
//  TwoSumII-InputArrayIsSorted.swift
//  leetcode
//
//  Created by Henry on 2019/4/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TwoSumII_InputArrayIsSortedSolution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var d = Dictionary<Int, Int>.init()
        
        var index = 0
        while index < numbers.count {
            let n = numbers[index]
            let remain = target - n
            let c = d[remain]
            if c == nil {
                d[n] = index
            } else {
                return [c! + 1, index + 1]
            }
            
            index += 1
        }
        
        return []
    }
    
    func test() -> Void {
        print(twoSum([2, 7, 11, 15], 9))
    }
}
