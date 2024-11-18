//
//  89.swift
//  LeetCode
//
//  Created by henry on 2024/11/18.
//

import Foundation

class Solution_89 {
    func grayCode(_ n: Int) -> [Int] {
        /**
         重点是发现格雷码的编码规则
         n = 1, 0 / 1 = > 0 / 1
         n = 2, 00 / 01 / 11 / 10 => 0, 1, 3, 2
         n = 3, 000, 001, 011, 010, 110, 111, 101, 100 => 0, 1, 3, 2, 6, 7, 5, 4
         
         规律:
         1. n+1 与 n 的前 2^n 项一致
         2. n+1 与 n 的后 2^n 项与前 2^n 项除了第一个bit差别, 其他bit位均符合镜像对称
         */
        
        let count = 1 << n
        var result = [Int].init(repeating: 0, count: count)
        result[1] = 1
        var start = 1
        while start < n {
            /**
             计算对折宽度
             */
            let width = 1 << start
            /**
             计算最高位
             */
            let highestBit = (1 << start)
            /**
             从第0位开始遍历, 对称赋值
             */
            for index in 0..<width {
                result[2*width-1-index] = result[index] + highestBit
            }
            
            start += 1
        }
        
        return result
    }
}
