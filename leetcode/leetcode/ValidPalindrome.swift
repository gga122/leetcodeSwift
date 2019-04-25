//
//  ValidPalindrome.swift
//  leetcode
//
//  Created by Henry on 2019/4/25.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ValidPalindromeSolution {
    func isPalindrome(_ s: String) -> Bool {
        if s.count <= 1 {
            return true
        }
        
        var chars = [UInt8]()
        for c in s.utf8 {
            if c >= 97 && c <= 122 {
                chars.append(c)
            }
            if c >= 65 && c <= 90 {
                chars.append(c + 32)
            }
            if c >= 48 && c <= 57 {
                chars.append(c)
            }
        }
        
        var i = 0
        var j = chars.count - 1
        while i < j {
            if chars[i] == chars[j] {
                j -= 1
                i += 1
            } else {
                return false
            }
        }
        return true
    }
    
    func test() -> Void {
        print(isPalindrome("A man, a plan, a canal: Panama"))
        print(isPalindrome("race a car"))
        print(isPalindrome("ab"))
        print(isPalindrome("0P"))
    }
}
