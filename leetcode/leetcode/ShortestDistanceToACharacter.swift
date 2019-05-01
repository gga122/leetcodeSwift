//
//  ShortestDistanceToACharacter.swift
//  leetcode
//
//  Created by Henry on 2019/5/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ShortestDistanceToACharacterSolution {
    func shortestToChar(_ S: String, _ C: Character) -> [Int] {
        if S.count <= 1 {
            return [0]
        }
        
        let chars = Array(S)
        var ret = Array.init(repeating: Int.max, count: chars.count)
        var indexes = [Int]()
        var i = 0
        while i < chars.count {
            if chars[i] == C {
                indexes.append(i)
                ret[i] = 0
            }
            i += 1
        }
        
        /* we treat left index as infinite at begin */
        var leftIndex = Int.max
        var rightIndex = indexes[0]
        var j = 1
        i = 0
        while i < chars.count {
            let leftAbsDistance = abs(leftIndex - i)
            let rightAbsDistance = abs(rightIndex - i)
            
            if ret[i] == 0 && j < indexes.count {
                leftIndex = rightIndex
                rightIndex = indexes[j]
                j += 1
            }
            
            ret[i] = min(leftAbsDistance, rightAbsDistance)
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(shortestToChar("loveleetcode", "e"))
    }
}
