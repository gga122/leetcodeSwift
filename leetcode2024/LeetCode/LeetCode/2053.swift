//
//  2053.swift
//  LeetCode
//
//  Created by henry on 2024/9/19.
//

import Foundation

class Solution_2053 {
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        var map = [String: Int]()
        var records = [String].init()
        
        for str in arr {
            if let count = map[str] {
                map[str] = count + 1
            } else {
                map[str] = 1
            }
        }
        
        for str in arr {
            if let count = map[str], count == 1 {
                records.append(str)
            }
        }
        
        if k - 1 < records.count {
            return records[k - 1]
        } else {
            return ""
        }
    }
    
    func test() {
        test1()
    }
    
    func test1() {
        let result = kthDistinct(["d","b","c","b","c","a"], 2)
        print(result)
    }
}
