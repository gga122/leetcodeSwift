//
//  ShortestCompletingWord.swift
//  leetcode
//
//  Created by Henry on 2019/5/9.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ShortestCompletingWordSolution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        if licensePlate.count == 0 || words.count == 0 {
            return ""
        }
        
        let licensePlate = licensePlate.lowercased()
        var charDic = [Character: Int]()
        for c in licensePlate {
            let asciiValue = Int(c.unicodeScalars.first!.value)
            if asciiValue < 97 || asciiValue > 122 {
                continue
            }
            if let count = charDic[c] {
                charDic[c] = count + 1
            } else {
                charDic[c] = 1
            }
        }
        
        var matched: String? = nil
        for word in words {
            let lowWord = word.lowercased()
            var remainChars = charDic
            var charCount = 0
            for c in lowWord {
                if let count = remainChars[c] {
                    if count == 1 {
                        remainChars.removeValue(forKey: c)
                    } else {
                        remainChars[c] = count - 1
                    }
                    
                    charCount += 1
                }
                
                if remainChars.count == 0 {
                    if charCount == lowWord.count {
                        return word
                    } else {
                        if matched == nil || matched!.count > lowWord.count {
                            matched = word
                        } 
                    }
                }
            }
        }
        
        return matched ?? ""
    }
    
    func test() -> Void {
        print(shortestCompletingWord("1s3 PSt", ["step", "steps", "stripe", "stepple"]))
        print(shortestCompletingWord("1s3 456", ["looks", "pest", "stew", "show"]))
    }
}
