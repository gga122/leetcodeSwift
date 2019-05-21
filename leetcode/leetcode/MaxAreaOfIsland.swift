//
//  MaxAreaOfIsland.swift
//  leetcode
//
//  Created by Henry on 2019/5/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaxAreaOfIslandSolution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let rc = grid.count
        let cc = grid[0].count
        var grid = grid
        var m = 0
        
        /* Scan from top left */
        for i in 0..<rc {
            for j in 0..<cc {
                /* we will skip all empty points */
                if grid[i][j] == 0 {
                    continue
                }
                
                var children = [(i, j)]
                grid[i][j] = 0
                var k = 0
                while k < children.count {
                    let (r, c) = children[k]
                    /* Scan top */
                    if r > 0 && grid[r-1][c] == 1 {
                        grid[r-1][c] = 0
                        children.append((r-1,c))
                    }
                    /* Scan bottom */
                    if r + 1 < rc && grid[r+1][c] == 1 {
                        grid[r+1][c] = 0
                        children.append((r+1,c))
                    }
                    /* Scan left */
                    if c > 0 && grid[r][c-1] == 1 {
                        grid[r][c-1] = 0
                        children.append((r,c-1))
                    }
                    /* Scan right */
                    if c + 1 < cc && grid[r][c+1] == 1 {
                        grid[r][c+1] = 0
                        children.append((r,c+1))
                    }
                    k += 1
                }
                m = max(m, children.count)
            }
        }

        return m
    }
    
    func test() -> Void {
        print(maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],
                               [0,0,0,0,0,0,0,1,1,1,0,0,0],
                               [0,1,1,0,1,0,0,0,0,0,0,0,0],
                               [0,1,0,0,1,1,0,0,1,0,1,0,0],
                               [0,1,0,0,1,1,0,0,1,1,1,0,0],
                               [0,0,0,0,0,0,0,0,0,0,1,0,0],
                               [0,0,0,0,0,0,0,1,1,1,0,0,0],
                               [0,0,0,0,0,0,0,1,1,0,0,0,0]]))
        print(maxAreaOfIsland([[0,0,0,0,0,0,0,0]]))
    }
}
