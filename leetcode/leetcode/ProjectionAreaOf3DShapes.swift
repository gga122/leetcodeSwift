//
//  ProjectionAreaOf3DShapes.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ProjectionAreaOf3DShapesSolution {
    func projectionArea(_ grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        
        var ret = 0
        var i = 0
        while i < grid.count {
            var tmpMaxYOZ = 0
            var tmpMaxXOZ = 0
            
            var j = 0
            while j < grid[i].count {
                if grid[i][j] != 0 {
                    ret += 1 // XOY
                }
                
                if tmpMaxXOZ < grid[i][j] {
                    tmpMaxXOZ = grid[i][j]
                }
                if tmpMaxYOZ < grid[j][i] {
                    tmpMaxYOZ = grid[j][i]
                }
                
                j += 1
            }
            
            ret += tmpMaxYOZ
            ret += tmpMaxXOZ
            
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(projectionArea([[2]]))
        print(projectionArea([[1, 2], [3, 4]]))
        print(projectionArea([[1, 0], [0, 2]]))
        print(projectionArea([[1, 1, 1], [1, 0, 1], [1, 1, 1]]))
        print(projectionArea([[2, 2, 2], [2, 1, 2], [2, 2, 2]]))
    }
}
