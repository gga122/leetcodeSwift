//
//  NumberOfIslands.swift
//  leetcode
//
//  Created by Henry on 2019/5/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NumberOfIslandsSolution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        
        let rowCount = grid.count
        let columnCount = grid[0].count
        var grid = grid
        
        var count = 0
        for i in 0..<rowCount {
            for j in 0..<columnCount {
                if grid[i][j] == "0" {
                    continue
                }
                
                grid[i][j] = "0"
                var children = [(i, j)]
                var k = 0
                while k < children.count {
                    let (rowIndex, columnIndex) = children[k]
                    if rowIndex - 1 >= 0 && grid[rowIndex-1][columnIndex] == "1" {
                        children.append((rowIndex-1, columnIndex))
                        grid[rowIndex-1][columnIndex] = "0"
                    }
                    if rowIndex + 1 < rowCount && grid[rowIndex+1][columnIndex] == "1" {
                        children.append((rowIndex+1, columnIndex))
                        grid[rowIndex+1][columnIndex] = "0"
                    }
                    if columnIndex - 1 >= 0 && grid[rowIndex][columnIndex-1] == "1" {
                        children.append((rowIndex, columnIndex-1))
                        grid[rowIndex][columnIndex-1] = "0"
                    }
                    if columnIndex + 1 < columnCount && grid[rowIndex][columnIndex+1] == "1" {
                        children.append((rowIndex, columnIndex+1))
                        grid[rowIndex][columnIndex+1] = "0"
                    }
                    
                    k += 1
                }
                
                count += 1
            }
        }
        
        return count
    }
    
    func test() -> Void {
        print(numIslands([["1","1","1","1","0"],
                          ["1","1","0","1","1"],
                          ["1","1","0","0","0"],
                          ["0","0","0","0","0"]]))
        print(numIslands([["1","1","0","0","0"],
                          ["1","1","0","0","0"],
                          ["0","0","1","0","0"],
                          ["0","0","0","1","1"]]))
    }
}
