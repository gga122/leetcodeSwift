//
//  IsSubsequence.swift
//  leetcode
//
//  Created by Henry on 2020/1/17.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class IsSubsequenceSolution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count > t.count {
            return false
        }
        
        let sChar = Array(s)
        let tChar = Array(t)
        
        var sIndex = 0
        var tIndex = 0
        while sIndex < sChar.count {
            if tIndex >= tChar.count {
                break
            }
            for i in tIndex..<tChar.count {
                if sChar[sIndex] == tChar[i] {
                    tIndex = i+1
                    sIndex += 1
                    break
                }
                if i == tChar.count-1 {
                    tIndex = i+1
                }
            }
        }
        
        return sIndex == sChar.count
    }
    
    func test() -> Void {
        print(isSubsequence("abc", "ahbgdc"))
        print(isSubsequence("axc", "ahbgdc"))
        print(isSubsequence("abc", ""))
        print(isSubsequence("acb", "ahbgdc"))
    }
}
