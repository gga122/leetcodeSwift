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
