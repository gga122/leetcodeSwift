//
//  PositionsOfLargeGroups.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PositionsOfLargeGroupsSolution {
    func largeGroupPositions(_ S: String) -> [[Int]] {
        if S.count < 3 {
            return []
        }
        
        var ret = [[Int]]()
        var previous: Character? = nil
        var count = 0
        var i = 0
        for c in S {
            if previous == nil {
                previous = c
                count = 1
            } else {
                if c == previous {
                    count += 1
                } else {
                    if count >= 3 {
                        let position = [i - count, i - 1]
                        ret.append(position)
                    }
                    previous = c
                    count = 1
                }
            }
            i += 1
        }
        if count >= 3 {
            ret.append([i - count, i - 1])
        }
        
        return ret
    }
    
    func test() -> Void {
        print(largeGroupPositions("abbxxxxzzy"))
        print(largeGroupPositions("abc"))
        print(largeGroupPositions("abcdddeeeeaabbbcd"))
        print(largeGroupPositions("aaa"))
    }
}
