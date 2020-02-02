//
//  MinimumIncrementToMakeArrayUnique.swift
//  leetcode
//
//  Created by MickyZhu on 2/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MinimumIncrementToMakeArrayUniqueSolution {
    func minIncrementForUnique(_ A: [Int]) -> Int {
        if A.count == 0 {
            return 0
        }
        
        var map = [Int: Int]()
        for num in A {
            if let count = map[num] {
                map[num] = count+1
            } else {
                map[num] = 1
            }
        }
        
        var res = 0
        
        let keys = map.keys
        let sortedKeys = keys.sorted()
        var minVal = sortedKeys.first!
        while map.count < A.count {
            if let count = map[minVal] {
                if count > 1 {
                    map[minVal] = 1
                    res += count - 1
                    
                    if let nextCount = map[minVal+1] {
                        map[minVal+1] = nextCount + count - 1
                    } else {
                        map[minVal+1] = count - 1
                    }
                }
            }
            
            minVal += 1
        }
                
        return res
    }
    
    func test() -> Void {
        print(minIncrementForUnique([1,2,2]))
        print(minIncrementForUnique([3,2,1,2,1,7]))
    }
}
