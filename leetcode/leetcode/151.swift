//
//  151.swift
//  leetcode
//
//  Created by mickyzhu on 2022/8/23.
//  Copyright © 2022 Henry. All rights reserved.
//

import Foundation

class Solution151 {
    func reverseWords(_ s: String) -> String {
        var chars = [Character].init(s)

        /* Remove prefix and suffix empty characters */
        while chars.first == " " {
            chars.removeFirst()
        }
        chars.reverse()
        while chars.first == " " {
            chars.removeFirst()
        }
        
        /* Remove middle empty characters */
        var indexes = [Int]()
        for i in chars.startIndex..<chars.endIndex {
            if chars[i] != " "  {
                continue
            }
            
            if i - 1 >= chars.startIndex && chars[i-1] == " " {
                indexes.append(i)
            }
        }
        for i in indexes.reversed() {
            chars.remove(at: i)
        }
        
        /* Reverse each word */
        chars.append(" ")
        var head = chars.startIndex
        var tail = chars.startIndex
        while tail < chars.endIndex {
            if chars[tail] == " " {
                var end = tail - 1
                while head < end {
                    chars.swapAt(head, end)
                    head += 1
                    end -= 1
                }
                
                head = tail + 1
            }
            
            tail += 1
        }
        chars.removeLast()
        
        let dst = String.init(chars)
        return dst
    }
    
    func reverseWords1(_ s: String) -> String {
        var components = s.components(separatedBy: " ")
        components = components.filter { comp in
            return comp != ""
        }
        
        components.reverse()
        let rs = components.joined(separator: " ")
        return rs
    }
    
    func test() {
        print(reverseWords("the sky is blue"))
        print(reverseWords(" hello world "))
        print(reverseWords("a good   example"))
    }
}
