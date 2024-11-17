//
//  165.swift
//  LeetCode
//
//  Created by henry on 2024/11/17.
//

import Foundation

class Solution_165 {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let comp1 = version1.components(separatedBy: .init(charactersIn: ".")).compactMap { Int($0) }
        let comp2 = version2.components(separatedBy: .init(charactersIn: ".")).compactMap { Int($0) }
        
        var index = 0
        while index < comp1.count || index < comp2.count {
            var a = 0
            if index < comp1.count {
                a = comp1[index]
            }
            var b = 0
            if index < comp2.count {
                b = comp2[index]
            }
            
            if a < b {
                return -1
            } else if a > b {
                return 1
            }
            index += 1
        }
        
        return 0
    }
}
