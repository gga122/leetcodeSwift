//
//  LargestUniqueNumber.swift
//  leetcode
//
//  Created by MickyZhu on 6/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class LargestUniqueNumberSolution {
    func largestUniqueNumber(_ A: [Int]) -> Int {
        var map = [Int: Int]()
        for n in A {
            if let count = map[n] {
                map[n] = count+1
            } else {
                map[n] = 1
            }
        }
        
        var maxVal = Int.min
        for (k, v) in map {
            if v > 1 {
                continue
            }
            
            maxVal = max(maxVal, k)
        }

        return maxVal != Int.min ? maxVal : -1
    }
    
    func test() -> Void {
        print(largestUniqueNumber([5,7,3,9,4,9,8,3,1]))
        print(largestUniqueNumber([9,9,8,8]))
    }
}
