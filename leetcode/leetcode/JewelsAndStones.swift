//
//  JewelsAndStones.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class JewelsAndStonesSolution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        if J.count == 0 || S.count == 0 {
            return 0
        }
        
        var allChars = Dictionary<Character, Int>.init()
        for sChar in S {
            var c = allChars[sChar]
            if c == nil {
                c = 1
            } else {
                c! += 1
            }
            allChars[sChar] = c
        }
        
        var count = 0
        for jChar in J {
            if allChars[jChar] != nil {
                count += allChars[jChar]!
            }
        }

        return count
    }
    
    func test() -> Void {
        print(numJewelsInStones("aA", "aAAbbbb"))
        print(numJewelsInStones("z", "ZZ"))
    }
}
