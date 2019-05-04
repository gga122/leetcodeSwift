//
//  GoatLatin.swift
//  leetcode
//
//  Created by Henry on 2019/5/5.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class GoatLatinSolution {
    func toGoatLatin(_ S: String) -> String {
        if S.count == 0 {
            return S
        }
        
        var set = Set<Character>.init()
        let vowelChars: Array<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        for c in vowelChars {
            set.insert(c)
        }
        
        let subStrings = S.split(separator: " ")
        var i = 0
        var components = [String]()
        while i < subStrings.count {
            var subString = subStrings[i]
            let startChar = subString[subString.startIndex]
            if !vowelChars.contains(startChar) {
                subString.append(subString.removeFirst())
            }
            subString = subString + "ma"
            var j = 0
            while j <= i {
                subString = subString + "a"
                j += 1
            }
            
            components.append(String(subString))
            i += 1
        }
        
        let ret = components.joined(separator: " ")
        return ret
    }
    
    func test() -> Void {
        print(toGoatLatin("I speak Goat Latin"))
        print(toGoatLatin("The quick brown fox jumped over the lazy dog"))
    }
}
