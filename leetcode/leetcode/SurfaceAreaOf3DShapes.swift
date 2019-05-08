//
//  SurfaceAreaOf3DShapes.swift
//  leetcode
//
//  Created by Henry on 2019/5/8.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SurfaceAreaOf3DShapesSolution {
    func surfaceArea(_ grid: [[Int]]) -> Int {
        var ret = 0
        var i = 0
        /* All surface area */
        while i < grid.count {
            var j = 0
            while j < grid[i].count {
                if grid[i][j] != 0 {
                    ret += grid[i][j] * 4 + 2
                }
                j += 1
            }
            i += 1
        }
        
        i = 0
        while i < grid.count {
            var j = 0
            while j < grid[i].count - 1 {
                /* remove all common area in Axis-X */
                ret -= min(grid[i][j + 1], grid[i][j]) * 2
                j += 1
            }
            i += 1
        }
        
        i = 0
        while i < grid.count - 1 {
            var j = 0
            while j < grid[i].count {
                /* remove all common area in Axis-Y */
                ret -= min(grid[i + 1][j], grid[i][j]) * 2
                j += 1
            }
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(surfaceArea([[2]]))
        print(surfaceArea([[1, 2], [3, 4]]))
        print(surfaceArea([[1, 0], [0, 2]]))
        print(surfaceArea([[1, 1, 1], [1, 0, 1], [1, 1, 1]]))
        print(surfaceArea([[2, 2, 2], [2, 1, 2], [2, 2, 2]]))
    }
}
