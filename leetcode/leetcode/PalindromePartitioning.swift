//
//  PalindromePartitioning.swift
//  leetcode
//
//  Created by Henry on 2019/5/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PalindromePartitioningSolution {
    func partition(_ s: String) -> [[String]] {
        if s.count == 1 {
            return [[s]]
        }
        
        var ret = [[String]]()
        var candidate = [String]()
        backTracking(&ret, Array(s), &candidate, 0)
        
        return ret
    }
    
    func backTracking(_ result: inout [[String]], _ chars: [Character], _ tmp: inout [String], _ index: Int) -> Void {
        if index == chars.count {
            result.append(tmp)
        } else {
            for i in index..<chars.count {
                if isPalindrome(chars, index, i) {
                    let sub = String(chars[index...i])
                    tmp.append(sub)
                    backTracking(&result, chars, &tmp, i + 1)
                    tmp.removeLast()
                }
            }
        }
    }
    
    func isPalindrome(_ chars: [Character], _ start: Int, _ end: Int) -> Bool {
        var start = start
        var end = end
        while start < end {
            if chars[start] != chars[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
    
    func test() -> Void {
        print(partition("aab"))
    }
}
