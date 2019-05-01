//
//  IslandPerimeter.swift
//  leetcode
//
//  Created by Henry on 2019/5/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class IslandPerimeterSolution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var ret = 0
        var i = 0
        while i < grid.count {
            var j = 0
            while j < grid[i].count {
                if grid[i][j] != 0 {
                    ret += 4
                    if i > 0 && grid[i - 1][j] != 0 {
                        ret -= 2
                    }
                    if j > 0 && grid[i][j - 1] != 0 {
                        ret -= 2
                    }
                }
                
                j += 1
            }
            
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(islandPerimeter([[0,1,0,0],
                               [1,1,1,0],
                               [0,1,0,0],
                               [1,1,0,0]]))
    }
}
