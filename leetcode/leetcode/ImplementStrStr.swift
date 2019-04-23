//
//  ImplementStrStr.swift
//  leetcode
//
//  Created by Henry on 2019/4/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ImplementStrStrSolution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty {
            return 0
        }
        
        var j = needle.startIndex
        var i = haystack.startIndex
        while i < haystack.endIndex && j < needle.endIndex {
            let c1 = haystack[i]
            let c2 = needle[j]
            
            if c1 != c2 {
                i = haystack.index(i, offsetBy: -needle.distance(from: needle.startIndex, to: j))
                j = needle.startIndex
            } else {
                j = needle.index(after: j)
            }
            
            i = haystack.index(after: i)
        }
        
        var index = -1
        if needle.distance(from: needle.startIndex, to: j) == needle.count {
            let distance = haystack.distance(from: haystack.startIndex, to: i)
            index = distance.advanced(by: 0) - needle.count
        }
        
        return index
    }
    
    func test() -> Void {
        print(strStr("hello", "ll"))
        print(strStr("aaaaa", "bba"))
        print(strStr("aaa", "a"))
        print(strStr("aaa", "aaa"))
        print(strStr("mississippi", "issip"))
    }
}
