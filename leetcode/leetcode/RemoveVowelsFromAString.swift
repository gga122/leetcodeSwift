//
//  RemoveVowelsFromAString.swift
//  leetcode
//
//  Created by MickyZhu on 5/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class RemoveVowelsFromAStringSolution {
    func removeVowels(_ S: String) -> String {
        let vowels = Set<Character>.init(arrayLiteral: "a", "e", "i", "o", "u")
        
        var chars = [Character]()
        for c in S {
            if vowels.contains(c) {
                continue
            }
            
            chars.append(c)
        }
        
        let s = String(chars)
        return s
    }
    
    func test() -> Void {
        print(removeVowels("leetcodeisacommunityforcoders"))
        print(removeVowels("aeiou"))
    }
}
