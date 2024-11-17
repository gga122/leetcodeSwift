//
//  3258.swift
//  LeetCode
//
//  Created by henry on 2024/11/17.
//

import Foundation

class Solution_3258 {
    func countKConstraintSubstrings(_ s: String, _ k: Int) -> Int {
        /**
         使用滑动窗口即可
         */
        var count = 0
        let chars = Array(s)
        /**
         i 记录为滑动窗口左边界
         */
        for i in 0..<chars.count {
            var numberOfZero = 0
            var numberOfOne = 0
            
            /**
             j 记录为右边界
             每一次移动后都需要判断下是不是满足条件
             */
            for j in i..<chars.count {
                let pivot = chars[j]
                if pivot == "1" {
                    numberOfOne += 1
                } else if pivot == "0" {
                    numberOfZero += 1
                }
                
                if numberOfOne <= k || numberOfZero <= k {
                    count += 1
                }
            }
        }
        
        return count
    }
}
