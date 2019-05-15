//
//  MaxIncreaseToKeepCitySkyline.swift
//  leetcode
//
//  Created by Henry on 2019/5/16.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaxIncreaseToKeepCitySkylineSolution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        let rowCount = grid.count
        if rowCount == 1 {
            return 0
        }
        let columnCount = grid[0].count
        if columnCount == 1 {
            return 0
        }
        
        var rowMax = [Int]()
        for i in 0..<rowCount {
            var maxValue = Int.min
            for j in 0..<columnCount {
                maxValue = max(maxValue, grid[i][j])
            }
            rowMax.append(maxValue)
        }
        var columnMax = [Int]()
        for i in 0..<columnCount {
            var maxValue = Int.min
            for j in 0..<rowCount {
                maxValue = max(maxValue, grid[j][i])
            }
            columnMax.append(maxValue)
        }
    
        var count = 0
        for i in 0..<rowCount {
            for j in 0..<columnCount {
                let v = grid[i][j]
                let upper = min(rowMax[i], columnMax[j])
                count += upper - v
            }
        }
        return count
    }
    
    func test() -> Void {
        print(maxIncreaseKeepingSkyline([[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]))
    }
}
