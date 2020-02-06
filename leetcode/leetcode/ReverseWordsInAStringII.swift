//
//  ReverseWordsInAStringII.swift
//  leetcode
//
//  Created by MickyZhu on 6/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ReverseWordsInAStringIISolution {
    func reverseWords(_ s: inout [Character]) {
        for i in 0..<s.count/2 {
            s.swapAt(i, s.count-1-i)
        }
        
        var startIndex = 0
        for i in 0..<s.count {
            if s[i] == " " || i == s.count-1 {
                var endIndex = i == s.count-1 ? i : i - 1
                
                while startIndex < endIndex {
                    s.swapAt(startIndex, endIndex)
                    startIndex += 1
                    endIndex -= 1
                }
                
                startIndex = i+1
            }
        }
    }
    
    func test() -> Void {
        var words: [Character] = ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
        reverseWords(&words)
        print(words)
    }
}
