//
//  MagicSquaresInGrid.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MagicSquaresInGridSolution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        if grid.count < 3 {
            return 0
        }
        if grid[0].count < 3 {
            return 0
        }
        
        var count = 0
        var fiveLocations = [(Int, Int)]()
        for i in 1..<grid.count-1 {
            for j in 1..<grid[i].count-1 {
                if grid[i][j] == 5 {
                    fiveLocations.append((i,j))
                }
            }
        }
        for (x,y) in fiveLocations {
            if isMagicGrid(grid, x, y) {
                count += 1
            }
        }
        
        return count
    }
    
    func isMagicGrid(_ grid: [[Int]], _ x: Int, _ y: Int) -> Bool {
        if grid[x][y] != 5 {
            return false
        }
        if grid[x-1][y-1] + grid[x-1][y] + grid[x-1][y+1] != 15 {
            return false
        }
        if grid[x][y-1] + grid[x][y] + grid[x][y+1] != 15 {
            return false
        }
        if grid[x+1][y-1] + grid[x+1][y] + grid[x+1][y+1] != 15 {
            return false
        }
        if grid[x-1][y-1] + grid[x][y-1] + grid[x+1][y-1] != 15 {
            return false
        }
        if grid[x-1][y] + grid[x][y] + grid[x+1][y] != 15 {
            return false
        }
        if grid[x-1][y+1] + grid[x][y+1] + grid[x+1][y+1] != 15 {
            return false
        }
        if grid[x-1][y-1] + grid[x][y] + grid[x+1][y+1] != 15 {
            return false
        }
        if grid[x+1][y-1] + grid[x][y] + grid[x-1][y+1] != 15 {
            return false
        }
        var set = Set<Int>()
        for tX in x-1...x+1 {
            for tY in y-1...y+1 {
                if grid[tX][tY] < 1 || grid[tX][tY] > 9 {
                    return false
                }
                if !set.insert(grid[tX][tY]).inserted {
                    return false
                }
            }
        }
        return true
    }
    
    func test() -> Void {
        print(numMagicSquaresInside([[4,3,8,4],
                                     [9,5,1,9],
                                     [2,7,6,2]]))
        print(numMagicSquaresInside([[4,7,8],
                                     [9,5,1],
                                     [2,3,6]]))
        print(numMagicSquaresInside([[1,8,6],
                                     [10,5,0],
                                     [4,2,9]]))
    }
}
