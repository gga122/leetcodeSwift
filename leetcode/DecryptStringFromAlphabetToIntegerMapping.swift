//
//  DecryptStringFromAlphabetToIntegerMapping.swift
//  leetcode
//
//  Created by mickyzhu on 2020/1/5.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class DecryptStringFromAlphabetToIntegerMappingSolution {
    func freqAlphabets(_ s: String) -> String {
        var map = [String: String]()
        for i in 1...26 {
            let key = "\(i)"
            let value = String(Character(UnicodeScalar(96+i)!))
            map[key] = value
        }
        
        var subs = [String]()
        let src = Array(s)
        
        var i = src.count - 1
        while i >= 0 {
            let c = src[i]
            if c == "#" {
                let tmp = String(src[i-2...i-1])
                subs.append(tmp)
                i -= 3
            } else {
                let tmp = String(src[i])
                subs.append(tmp)
                i -= 1
            }
        }

        subs = subs.reversed()
        var results = ""
        for str in subs {
            results += map[str]!
        }
        
        return results
    }
    
    func test() -> Void {
        print(freqAlphabets("10#11#12"))
        print(freqAlphabets("1326#"))
    }
}
