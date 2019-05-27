//
//  DailyTemperatures.swift
//  leetcode
//
//  Created by Henry on 2019/5/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DailyTemperaturesSolution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        if T.count == 0 {
            return []
        }
        if T.count == 1 {
            return [0]
        }
        
        var ret = Array<Int>.init(repeating: 0, count: T.count)
        var stack = [Int]()
        var i = T.count - 1
        while i >= 0 {
            while !stack.isEmpty && T[i] >= T[stack.last!] {
                stack.removeLast()
            }
            if stack.isEmpty {
                ret[i] = 0
            } else {
                ret[i] = stack.last! - i
            }
            stack.append(i)
            
            i -= 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(dailyTemperatures([73,74,75,71,69,72,76,73]))
        print(dailyTemperatures([55,38,53,81,61,93,97,32,43,78]))
    }
}
