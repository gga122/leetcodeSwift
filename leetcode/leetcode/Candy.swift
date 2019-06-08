//
//  Candy.swift
//  leetcode
//
//  Created by Henry on 2019/6/8.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CandySolution {
    func candy(_ ratings: [Int]) -> Int {
        if ratings.count == 0 {
            return 0
        }
        if ratings.count == 1 {
            return 1
        }
        
        var candys = [Int].init(repeating: 1, count: ratings.count)
        for i in 1..<ratings.count {
            if ratings[i] > ratings[i-1] {
                candys[i] = candys[i-1] + 1
            }
        }
        for i in (0..<ratings.count - 1).reversed() {
            if ratings[i] > ratings[i+1] {
                candys[i] = max(candys[i], candys[i+1]+1)
            }
        }
        
        let total = candys.reduce(0, +)
        return total
    }
    
    func test() -> Void {
        print(candy([1,0,2]))
        print(candy([1,2,2]))
        print(candy([1,3,4,5,2]))
        print(candy([1,3,2,2,1]))
    }
}
