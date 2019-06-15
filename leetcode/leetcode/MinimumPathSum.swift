//
//  MinimumPathSum.swift
//  leetcode
//
//  Created by Henry on 2019/6/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinimumPathSumSolution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        if grid.count == 1 {
            return grid[0].reduce(0, +)
        }
        
        var grid = grid
        let rowCount = grid.count
        for i in 1..<rowCount {
            grid[i][0] += grid[i-1][0]
        }
        
        let columnCount = grid[0].count
        for i in 1..<columnCount {
            grid[0][i] += grid[0][i-1]
        }
        
        for i in 1..<rowCount {
            for j in 1..<columnCount {
                grid[i][j] += min(grid[i-1][j], grid[i][j-1])
            }
        }
        
        return grid.last!.last!
    }
    
    func test() -> Void {
        print(minPathSum([[1,3,1],
                          [1,5,1],
                          [4,2,1]]))
    }
}
