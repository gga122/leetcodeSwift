//
//  PalindromeNumber.swift
//  leetcode
//
//  Created by Henry on 2019/4/14.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PalindromeNumberSolution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x % 10 == 0 && x != 0 {
            return false
        }

        var x = x
        var revertedNumber = 0
        while x > revertedNumber {
            revertedNumber = revertedNumber * 10 + x % 10
            x /= 10
        }
        
        if x == revertedNumber || x == revertedNumber / 10 {
            return true
        }
        
        return false
    }
    
    func test() -> Void {
        print(isPalindrome(121))
        print(isPalindrome(-121))
        print(isPalindrome(10))
        print(isPalindrome(1000021))
    }
}
