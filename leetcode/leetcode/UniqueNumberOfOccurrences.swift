//
//  UniqueNumberOfOccurrences.swift
//  leetcode
//
//  Created by mickyzhu on 2020/1/8.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class UniqueNumberOfOccurrencesSolution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map = [Int: Int]()
        for ele in arr {
            if let cnt = map[ele] {
                map[ele] = cnt+1
            } else {
                map[ele] = 1
            }
        }
        
        var set = Set<Int>()
        for (_, v) in map {
            set.insert(v)
        }
        
        return set.count == map.count
    }
    
    func test() -> Void {
        print(uniqueOccurrences([1,2,2,1,1,3])
    }
}
