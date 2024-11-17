//
//  3239.swift
//  LeetCode
//
//  Created by henry on 2024/11/17.
//

import Foundation

class Solution_3239 {
    func minFlips(_ grid: [[Int]]) -> Int {
        let allRowCount = grid.map { gapOfPalindrome(nums: $0) }.reduce(0, +)
        let allColumnCount = exchangeRowAndColumn(grid).map { gapOfPalindrome(nums: $0)}.reduce(0, +)
        return min(allRowCount, allColumnCount)
    }
    
    /**
     交换行和列
     */
    func exchangeRowAndColumn(_ grid: [[Int]]) -> [[Int]] {
        let rowCount = grid.count
        let columnCount = grid[0].count
        var result = [[Int]].init(repeating: .init(repeating: 0, count: rowCount), count: columnCount)
        for row in 0..<columnCount {
            for column in 0..<rowCount {
                result[row][column] = grid[column][row]
            }
        }
        return result
    }
    
    /**
     计算转换为回文数组的最小操作数
     */
    func gapOfPalindrome(nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }

        var count = 0
        var begin = 0
        var end = nums.count - 1
        while begin < end {
            if nums[begin] != nums[end] {
                count += 1
            }
            begin += 1
            end -= 1
        }
        
        return count
    }
}
