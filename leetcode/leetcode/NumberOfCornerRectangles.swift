//
//  NumberOfCornerRectangles.swift
//  leetcode
//
//  Created by Henry on 2019/6/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NumberOfCornerRectanglesSolution {
    func countCornerRectangles(_ grid: [[Int]]) -> Int {
        let rowCount = grid.count
        let columnCount = grid[0].count
        var res = 0
        for i in 0..<rowCount {
            for j in i+1..<rowCount {
                var cnt = 0
                for k in 0..<columnCount {
                    if grid[i][k] == 0 { continue }
                    if grid[j][k] == 0 { continue }
                    
                    cnt += 1
                }
                res += cnt * (cnt-1) / 2
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(countCornerRectangles([[1, 0, 0, 1, 0],
                                     [0, 0, 1, 0, 1],
                                     [0, 0, 0, 1, 0],
                                     [1, 0, 1, 0, 1]]))
        print(countCornerRectangles([[1, 1, 1],
                                     [1, 1, 1],
                                     [1, 1, 1]]))
        print(countCornerRectangles([[1, 1, 1, 1]]))
    }
}
