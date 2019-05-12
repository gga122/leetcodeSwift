//
//  LongestWordInDictionary.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestWordInDictionarySolution {
    
    
    func longestWord(_ words: [String]) -> String {
        if words.count == 0 {
            return ""
        }
        
        var words = words
        words.sort()
        var set = Set<String>()
        var ret = ""
        for word in words {
            if word.count == 1 || set.contains(word.substring(to: word.index(before: word.endIndex))) {
                ret = word.count > ret.count ? word : ret;
                set.insert(word)
            }
        }
        return ret
    }
    
    func test() -> Void {
        print(longestWord(["w","wo","wor","worl", "world"]))
        print(longestWord(["a", "banana", "app", "appl", "ap", "apply", "apple"]))
    }
}
