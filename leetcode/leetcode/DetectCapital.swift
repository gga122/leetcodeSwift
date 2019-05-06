//
//  DetectCapital.swift
//  leetcode
//
//  Created by Henry on 2019/5/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DetectCapitalSolution {
    func detectCapitalUse(_ word: String) -> Bool {
        if word.count == 0 {
            return false
        }
        if word.count == 1 {
            return true
        }
        
        let chars = Array(word)
        let firstCharValue = Int(chars.first!.unicodeScalars.first!.value)
        /* lower */
        if firstCharValue >= 97 && firstCharValue <= 122 {
            var i = 1
            while i < chars.count {
                let cValue = Int(chars[i].unicodeScalars.first!.value)
                if cValue < 97 || cValue > 122 {
                    return false
                }
                i += 1
            }
        } else {
            let lastCharValue = Int(chars.last!.unicodeScalars.first!.value)
            /* Upper */
            if lastCharValue >= 65 && lastCharValue <= 90 {
                var i = 1
                while i < chars.count {
                    let cValue = Int(chars[i].unicodeScalars.first!.value)
                    if cValue < 65 || cValue > 90 {
                        return false
                    }
                    i += 1
                }
            } else {
                var i = 1
                while i < chars.count {
                    let cValue = Int(chars[i].unicodeScalars.first!.value)
                    if cValue >= 65 && cValue <= 90 {
                        return false
                    }
                    i += 1
                }
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(detectCapitalUse("USA"))
        print(detectCapitalUse("FlaG"))
    }
}
