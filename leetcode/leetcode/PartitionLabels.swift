//
//  PartitionLabels.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PartitionLabelsSolution {
    func partitionLabels(_ S: String) -> [Int] {
        let chars = Array(S)
        
        /* Record last index of each character */
        var maps = [Character: Int]()
        for i in 0..<chars.count {
            let char = chars[i]
            maps[char] = i
        }
        
        /* Expand as possible */
        var ret = [Int]()
        var i = 0
        while i < chars.count {
            let char = chars[i]
            var endIndex = maps[char]!
            var startIndex = i + 1
            while startIndex < endIndex {
                let c = chars[startIndex]
                /* expand end index when find new char range */
                if maps[c]! > endIndex {
                    endIndex = maps[c]!
                }
                startIndex += 1
            }
            ret.append(endIndex - i + 1)
            
            i = endIndex + 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(partitionLabels("ababcbacadefegdehijhklij"))
    }
}
