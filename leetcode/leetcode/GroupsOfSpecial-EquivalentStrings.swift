//
//  GroupsOfSpecial-EquivalentStrings.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class GroupsOfSpecial_EquivalentStringsSolution {
    func numSpecialEquivGroups(_ A: [String]) -> Int {
        if A.count <= 1 {
            return A.count
        }
        
        let charCount = A.first!.count
        var set = Set<String>.init()
        if charCount <= 2 {
            for str in A {
                set.insert(str)
            }
        } else {
            for str in A {
                let chars = Array(str)
                var i = 0
                var oddChars = [Character]()
                var evenChars = [Character]()
                while i < chars.count {
                    let c = chars[i]
                    if i % 2 == 0 {
                        evenChars.append(c)
                    } else {
                        oddChars.append(c)
                    }
                    i += 1
                }
                oddChars.sort()
                evenChars.sort()
                let s = String.init(oddChars + evenChars)
                set.insert(s)
            }
        }
        
        return set.count
    }
    
    func test() -> Void {
        print(numSpecialEquivGroups(["a", "b", "c", "a", "c", "c"]))
        print(numSpecialEquivGroups(["aa", "bb", "ab", "ba"]))
        print(numSpecialEquivGroups(["abc", "acb", "bac", "bca", "cab", "cba"]))
        print(numSpecialEquivGroups(["abcd", "cdab", "adcb", "cbad"]))
    }
}
