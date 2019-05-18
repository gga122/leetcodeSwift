//
//  FindAndReplacePattern.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindAndReplacePatternSolution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        if words.count == 0 {
            return []
        }
        
        var ret = [String]()
        let patternChars = Array(pattern)
        for word in words {
            if word.count != pattern.count {
                continue
            }
            
            var wordMaps = [Character: Character]()
            var patternMaps = [Character: Character]()
            let wordChars = Array(word)
            var matched = true
            for i in 0..<word.count {
                let wordChar = wordChars[i]
                let patternChar = patternChars[i]
                if let pChar = wordMaps[wordChar] {
                    if pChar != patternChar {
                        matched = false
                        break
                    }
                } else {
                    if let wChar = patternMaps[patternChar] {
                        if wChar != wordChar {
                            matched = false
                            break
                        }
                    } else {
                        wordMaps[wordChar] = patternChar
                        patternMaps[patternChar] = wordChar
                    }
                }
            }
            if matched {
                ret.append(word)
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(findAndReplacePattern(["abc","deq","mee","aqq","dkd","ccc"], "abb"))
    }
}
