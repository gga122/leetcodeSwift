//
//  1137.swift
//  LeetCode
//
//  Created by henry on 2024/11/14.
//

import Foundation

class Solution_1137 {
    func tribonacci(_ n: Int) -> Int {
        switch n {
        case 0:
            return 0
        case 1:
            return 1
        case 2:
            return 1
        default:
            var result = 0
            var start = 3
            var a_1 = 1, a_2 = 1, a_3 = 0
            while start <= n {
                result = a_1 + a_2 + a_3
                a_3 = a_2
                a_2 = a_1
                a_1 = result
                start += 1
            }
            
            return result
        }
    }
}
