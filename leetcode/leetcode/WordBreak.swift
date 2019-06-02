//
//  WordBreak.swift
//  leetcode
//
//  Created by Henry on 2019/6/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class WordBreakSolution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        var wordSet = Set(wordDict)
        var maxWordLen = 0
        for word  in wordDict {
            maxWordLen = max(maxWordLen, word.count)
        }
        
        dp[0] = true
        var s = Array(s)
        for start in stride(from: 0, to: s.count, by: 1) {
            if !dp[start] {
                continue
            }
            
            for end in stride(from: start, to: s.count, by: 1) {
                if end - start + 1 > maxWordLen {
                    break
                }
                
                if dp[start] && wordSet.contains(String(s[start...end])) {
                    dp[end + 1] = true
                }
            }
        }
        
        return dp[s.count]
    }

    func test() -> Void {
        print(wordBreak("leetcode", ["leet", "code"]))
        print(wordBreak("applepenapple", ["apple", "pen"]))
        print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
        print(wordBreak("a", []))
        print(wordBreak("a", ["b"]))
        print(wordBreak("aaaaaaa", ["aaaa","aaa"]))
    }
}
