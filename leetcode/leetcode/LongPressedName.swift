//
//  LongPressedName.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongPressedNameSolution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        if name.count == 0 || typed.count == 0 {
            return false
        }
        if name.count > typed.count {
            return false
        }

        let nameChars = Array(name)
        let typedChars = Array(typed)
        
        var i = 0
        var j = 0
        while i < nameChars.count {
            while j < typedChars.count {
                if nameChars[i] == typedChars[j] {
                    i += 1
                    j += 1
                    break
                }
                
                if j - 1 >= 0 {
                    if typedChars[j] == typedChars[j - 1] {
                        j += 1
                        break
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
            
            if i < nameChars.count && j == typedChars.count {
                return false
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(isLongPressedName("alex", "aaleex"))
        print(isLongPressedName("saeed", "ssaaedd"))
        print(isLongPressedName("leelee", "lleeelee"))
        print(isLongPressedName("laiden", "laiden"))
        print(isLongPressedName("kikcxmvzi", "kiikcxxmmvvzz"))
        print(isLongPressedName("pyplrz", "ppyypllr"))
    }
}
