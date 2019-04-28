//
//  ToLowerCase.swift
//  leetcode
//
//  Created by Henry on 2019/4/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ToLowerCaseSolution {
    func toLowerCase(_ str: String) -> String {
        if str.count == 0 {
            return str
        }
        
        var ret = ""
        for aChar in str {
            let v = aChar.unicodeScalars.first!.value
            if Int(v) >= 65 && Int(v) <= 90 {
                let lowCase = Character.init(Unicode.Scalar.init(v.advanced(by: 32))!)
                ret.append(lowCase)
            } else {
                ret.append(aChar)
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(toLowerCase("Hello"))
        print(toLowerCase("here"))
        print(toLowerCase("LOVELY"))
    }
}
