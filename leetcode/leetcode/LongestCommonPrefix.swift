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
        
        var prefix = strs.first!
        
        for i in 1..<strs.count {
            while !strs[i].hasPrefix(prefix) {
                prefix = String(prefix.prefix(prefix.count - 1))
                if prefix.isEmpty {
                    return ""
                }
            }
        }
        
        return prefix
    }
    
    func test() -> Void {
        print(longestCommonPrefix(["flower", "flow", "flight"]))
        print(longestCommonPrefix(["dog", "racecar", "car"]))
        print(longestCommonPrefix(["aa", "a"]))
        print(longestCommonPrefix(["abab","aba",""]))
    }
}
