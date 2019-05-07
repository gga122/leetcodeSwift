//
//  VerifyingAnAlienDictionary.swift
//  leetcode
//
//  Created by Henry on 2019/5/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class VerifyingAnAlienDictionarySolution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var hashs = [Character: Int]()
        let chars = Array(order)
        var i = 0
        while i < chars.count {
            hashs[chars[i]] = i
            i += 1
        }
        
        i = 1
        while i < words.count {
            let word1 = words[i - 1]
            let word2 = words[i]
            
            let wordChar1 = Array(word1)
            let wordChar2 = Array(word2)
            
            var j = 0
            var flag = false
            while j < wordChar1.count && j < wordChar2.count {
                let c1 = wordChar1[j]
                let c2 = wordChar2[j]
                
                let v1 = hashs[c1]
                let v2 = hashs[c2]
                if v1! < v2! {
                    flag = true
                    break
                } else if v1! > v2! {
                    return false
                }
                j += 1
            }
            
            if wordChar1.count > wordChar2.count && !flag {
                return false
            }
            
            i += 1
        }
        
        return true
    }
    
    func test() -> Void {
        print(isAlienSorted(["hello", "leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
        print(isAlienSorted(["word", "world", "row"], "worldabcefghijkmnpqstuvxyz"))
        print(isAlienSorted(["apple", "app"], "abcdefghijklmnopqrstuvwxyz"))
        print(isAlienSorted(["kuvp", "q"], "ngxlkthsjuoqcpavbfdermiywz"))
    }
}
