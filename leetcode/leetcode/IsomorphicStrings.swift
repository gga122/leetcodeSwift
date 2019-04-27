//
//  IsomorphicStrings.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class IsomorphicStringsSolution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let sChars = Array(s)
        let tChars = Array(t)
        
        var dSrc = Dictionary<Character, Character>.init()
        var dDst = Dictionary<Character, Character>.init()
        var index = 0
        while index < sChars.count {
            let sChar = sChars[index]
            let tChar = tChars[index]
            let m = dSrc[sChar]
            let n = dDst[tChar]
            if m == nil && n == nil {
                dSrc[sChar] = tChar
                dDst[tChar] = sChar
            } else {
                if m != nil && m != tChar {
                    return false
                }
                if n != nil && n != sChar {
                    return false
                }
            }
            
            index += 1
        }
        return true
    }
    
    
    func test() -> Void {
        print(isIsomorphic("ab", "aa"))
        print(isIsomorphic("egg", "add"))
        print(isIsomorphic("foo", "bar"))
        print(isIsomorphic("paper", "title"))
    }
}
