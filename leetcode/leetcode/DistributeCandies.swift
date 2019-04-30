//
//  DistributeCandies.swift
//  leetcode
//
//  Created by Henry on 2019/5/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DistributeCandiesSolution {
    func distributeCandies(_ candies: [Int]) -> Int {
        if candies.count == 0 {
            return 0
        }
        
        var set = Set<Int>.init()
        var i = 0
        while i < candies.count {
            let candy = candies[i]
            set.insert(candy)
            if set.count == candies.count / 2 {
                break
            }
            
            i += 1
        }
        
        return set.count
    }
    
    func test() -> Void {
        print(distributeCandies([1, 1, 2, 2, 3, 3]))
        print(distributeCandies([1, 1, 2, 3]))
    }
}
