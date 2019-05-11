//
//  ReverseOnlyLetters.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReverseOnlyLettersSolution {
    func reverseOnlyLetters(_ S: String) -> String {
        var chars = Array(S)
        var start = 0
        var end = chars.count - 1
        while start < end {
            let sValue = chars[start]
            if sValue < "A" || sValue > "z" || (sValue > "Z" && sValue < "a") {
                start += 1
                continue
            }
            let eValue = chars[end]
            if eValue < "A" || eValue > "z" || (eValue > "Z" && eValue < "a") {
                end -= 1
                continue
            }
            chars[start] = eValue
            chars[end] = sValue
            
            start += 1
            end -= 1
        }
        
        return String(chars)
    }
    
    func test() -> Void {
        print(reverseOnlyLetters("ab-cd"))
        print(reverseOnlyLetters("a-bC-dEf-ghIj"))
        print(reverseOnlyLetters("Test1ng-Leet=code-Q!"))
    }
}
