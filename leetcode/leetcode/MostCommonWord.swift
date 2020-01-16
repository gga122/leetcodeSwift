//
//  MostCommonWord.swift
//  leetcode
//
//  Created by Henry on 2020/1/17.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MostCommonWordSolution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        var banSet = Set<String>()
        for bWord in banned {
            let lowercase = bWord.lowercased()
            banSet.insert(lowercase)
        }
        
        var seperators = Set<Character>()
        for c in Array("!?',;. ") {
            seperators.insert(c)
        }
        
        var wordMap = [String: Int]()
        let chars = Array(paragraph)
        var anchor = 0
        var index = 0
        while index < chars.count {
            let c = chars[index]
            if seperators.contains(c) || (index == chars.count-1 && !seperators.contains(c)) {
                let endIndex = seperators.contains(c) ? index-1 : index
                let word = String(chars[anchor...endIndex]).lowercased()
//                print(word)
                /* Insert in map */
                if let count = wordMap[word] {
                    wordMap[word] = count + 1
                } else {
                    wordMap[word] = 1
                }
                
                /* Find next valid index */
                var nextValidIndex = Int.max
                for i in index+1..<chars.count {
                    if !seperators.contains(chars[i]) {
                        nextValidIndex = i
                        break
                    }
                }
                if nextValidIndex == Int.max {
                    break
                } else {
                    anchor = nextValidIndex
                    index = anchor
                }
            } else {
                index += 1
            }
        }
        
        var ret = ""
        var maxCount = Int.min
        for (k, v) in wordMap {
            if banSet.contains(k) {
                continue
            }
            
            if maxCount < v {
                maxCount = v
                ret = k
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(mostCommonWord("Bob", []))
        print(mostCommonWord("Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"]))
    }
}
