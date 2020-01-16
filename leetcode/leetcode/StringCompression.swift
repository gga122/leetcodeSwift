//
//  StringCompression.swift
//  leetcode
//
//  Created by Henry on 2020/1/16.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class StringCompressionSolution {
    func compress(_ chars: inout [Character]) -> Int {
        if chars.count <= 1 {
            return chars.count
        }
        
        var anchor = 0
        var num = 0
        for read in 0..<chars.count {
            if chars[anchor] == chars[read] {
                num += 1
            } else {
                if num > 1 {
                    let tmp = Array(String(num))
                    for c in tmp {
                        anchor += 1
                        chars[anchor] = c
                    }
                    num = 1
                }
                anchor += 1
                chars[anchor] = chars[read]
            }
        }
        if num > 1 {
            let tmp = Array(String(num))
            for c in tmp {
                anchor += 1
                chars[anchor] = c
            }
        }
        anchor += 1
        
        return anchor
    }
    
    func test() -> Void {
        var chars1: [Character] = ["a","a","b","b","c","c","c"]
        let l1 = compress(&chars1)
        print(chars1[0..<l1])

        var chars2: [Character] = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
        let l2 = compress(&chars2)
        print(chars2[0..<l2])

        var chars3: [Character] = ["a"]
        let l3 = compress(&chars3)
        print(chars3[0..<l3])

        var chars4: [Character] = ["a","a","a","b","b","a","a"]
        let l4 = compress(&chars4)
        print(chars4[0..<l4])
        
        var chars5: [Character] = ["a","b","c"]
        let l5 = compress(&chars5)
        print(chars5[0..<l5])
    }
}
