//
//  LongestCommonPrefix.swift
//  leetcode
//
//  Created by Henry on 2019/4/14.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestCommonPrefixSolution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        if strs.count == 1 {
            return strs.first!
        }
        
        var result = String.init()
        let firstStr = strs[0]
        let subs = strs[1...strs.count - 1]
        var index = 0
        var end = false
        for c in firstStr {
            for sub in subs {
                if sub.count == 0 {
                    end = true
                    break
                }
                let idx = sub.index(sub.startIndex, offsetBy: index)
                let distance = sub.distance(from:sub.endIndex, to: idx)
                if distance >= 0 {
                    end = true
                    break
                }
                if c != sub[idx] {
                    end = true
                    break
                }
            }
            
            if end {
                break
            } else {
                result.append(c)
            }
            
            index += 1
        }
        
        return result
    }
    
    func test() -> Void {
        print(longestCommonPrefix(["flower", "flow", "flight"]))
        print(longestCommonPrefix(["dog", "racecar", "car"]))
        print(longestCommonPrefix(["aa", "a"]))
        print(longestCommonPrefix(["abab","aba",""]))
    }
}
