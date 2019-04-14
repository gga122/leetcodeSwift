//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  leetcode
//
//  Created by Henry on 2019/4/14.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestSubstringWithoutRepeatingCharactersSolution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longestLength = 0
        var charSet = Set<Character>.init()
        var chars = Array<Character>.init()
        var index = 0;
        for aChar in s {
            if charSet.contains(aChar) {
                if longestLength < chars.count {
                    longestLength = chars.count
                }
                if chars.last == aChar {
                    chars.removeAll()
                    charSet.removeAll()
                    chars.append(aChar)
                    charSet.update(with: aChar)
                } else {
                    while chars.first != aChar {
                        let c = chars.removeFirst()
                        charSet.remove(c)
                    }
                    chars.append(chars.removeFirst())
                }
            } else {
                charSet.update(with: aChar)
                chars.append(aChar)
            }
            
            index += 1;
        }
    
        if longestLength < chars.count {
            longestLength = chars.count
        }
        
        return longestLength
    }
    
    func test() -> Void {
        print(lengthOfLongestSubstring(" "))
        print(lengthOfLongestSubstring("aab"))
        print(lengthOfLongestSubstring("dvdf"))
        print(lengthOfLongestSubstring("abcabcbb"))
        print(lengthOfLongestSubstring("bbbbb"))
        print(lengthOfLongestSubstring("pwwkew"))
        print(lengthOfLongestSubstring("ckilbkd"))
    }
}
