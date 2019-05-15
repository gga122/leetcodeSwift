//
//  FindAllAnagramsInAString.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindAllAnagramsInAStringSolution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var hashs = [Character: Int]()
        for c in p {
            if let v = hashs[c] {
                hashs[c] = v + 1
            } else {
                hashs[c] = 1
            }
        }
        
        var ret = [Int]()
        let chars = Array(s)
        
        /*
         slide window: [i, j]
         
         */
 
        var i = 0
        var j = 0
        var matched = false
        var cHashs = hashs
        while i + j < chars.count {
            let char = chars[i + j]
            if matched {
                if char == chars[i + j - p.count] {
                    i += 1
                    ret.append(i)
                } else {
                    /* If char is unique, skip the whole window */
                    if hashs[char] != nil {
                        i = i + 1
                    } else {
                        i = i + j + 1
                    }
                    
                    j = 0
                    matched = false
                    cHashs = hashs
                }
            } else {
                /* Matching */
                if let c = cHashs[char] {
                    if c == 1 {
                        cHashs.removeValue(forKey: char)
                    } else {
                        cHashs[char] = c - 1
                    }
                    j += 1
                    
                    if cHashs.count == 0 {
                        matched = true
                        ret.append(i)
                    }
                } else {
                    /* If equal to first char in slide window */
                    if char == chars[i] {
                        i += 1
                    } else {
                        /* If char is unique, skip the whole window */
                        if hashs[char] != nil {
                            i = i + 1
                        } else {
                            i = i + j + 1
                        }
                        
                        j = 0
                        cHashs = hashs
                    }
                }
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(findAnagrams("cbaebabacd", "abc"))
        print(findAnagrams("abab", "ab"))
        print(findAnagrams("baa", "aa"))
        print(findAnagrams("abacbabc", "abc"))
        print(findAnagrams("abaacbabc", "abc"))
    }
}
