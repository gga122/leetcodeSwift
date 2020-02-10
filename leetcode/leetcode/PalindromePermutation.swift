//
//  PalindromePermutation.swift
//  leetcode
//
//  Created by MickyZhu on 10/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class PalindromePermutationSolution {
    func canPermutePalindrome(_ s: String) -> Bool {
        var map = [Character: Int]()
        let chars = Array(s)
        for c in chars {
            if let count = map[c] {
                map[c] = count + 1
            } else {
                map[c] = 1
            }
        }
        
        var oddCount = 0
        for (_,v) in map {
            if v % 2 != 0 {
                if oddCount > 0 {
                    return false
                }
                
                oddCount += 1
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(canPermutePalindrome("code"))
        print(canPermutePalindrome("aab"))
        print(canPermutePalindrome("carerac"))
    }
}
