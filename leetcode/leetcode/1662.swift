//
//  1662.swift
//  leetcode
//
//  Created by mickyzhu on 2022/8/22.
//  Copyright © 2022 Henry. All rights reserved.
//

import Foundation

class Solution1662 {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        let str1 = word1.joined(separator: "")
        let str2 = word2.joined(separator: "")
        
        return str1 == str2
    }
    
    func test() {
        let sol = Solution1662.init()
        print(sol.arrayStringsAreEqual(["ab", "c"], ["a", "bc"]))
    }
}




