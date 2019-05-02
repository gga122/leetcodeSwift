//
//  LongestUncommonSubsequenceI.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LongestUncommonSubsequenceISolution {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        if a == b {
            return -1
        }
        
        return max(a.count, b.count)
    }
    
    func test() -> Void {
        print(findLUSlength("aba", "cbc"))
    }
}
