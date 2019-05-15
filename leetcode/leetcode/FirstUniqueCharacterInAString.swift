//
//  FirstUniqueCharacterInAString.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FirstUniqueCharacterInAStringSolution {
    func firstUniqChar(_ s: String) -> Int {
        if s.count == 0 {
            return -1
        }
        if s.count == 1 {
            return 0
        }
        
        var hashs = [Character: (Int, Int)]() // Index, Count
        let chars = Array(s)
        for i in 0..<chars.count {
            let c = chars[i]
            if let v = hashs[c] {
                hashs[c] = (v.0, v.1 + 1)
            } else {
                hashs[c] = (i, 1)
            }
        }
        
        var index = Int.max
        for (_, v) in hashs {
            if v.1 > 1 {
                continue
            }
            if v.0 < index {
                index = v.0
            }
        }
        if index == Int.max {
            return -1
        }
        return index
    }
    
    func test() -> Void {
        print(firstUniqChar("leetcode"))
        print(firstUniqChar("loveleetcode"))
    }
}
