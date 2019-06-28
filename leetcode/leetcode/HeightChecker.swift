//
//  HeightChecker.swift
//  leetcode
//
//  Created by Henry on 2019/6/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class HeightCheckerSolution {
    func heightChecker(_ heights: [Int]) -> Int {
        if heights.count <= 1 {
            return 0
        }
        
        let sorted = heights.sorted()
        var res = 0
        for i in 0..<heights.count {
            if sorted[i] != heights[i] {
                res += 1
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(heightChecker([1,1,4,2,1,3]))
    }
}
