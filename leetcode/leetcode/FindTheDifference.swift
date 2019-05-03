//
//  FindTheDifference.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindTheDifferenceSolution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        if s.count == 0 {
            return t.first!
        }
        
        let sChars = Array(s)
        let tChars = Array(t)
        var retValue = 0
        for tChar in tChars {
            retValue ^= Int(tChar.unicodeScalars.first!.value)
        }
        for sChar in sChars {
            retValue ^= Int(sChar.unicodeScalars.first!.value)
        }
        
        return Character.init(.init(UInt8(retValue)))
    }
    
    func test() -> Void {
        print(findTheDifference("abcd", "abcde"))
    }
}
