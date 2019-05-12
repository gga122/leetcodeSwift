//
//  RottingOranges.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RottingOrangesSolution {
    
    /* 0: top, 1: left 2: bottom 3: right */
    let dr = [-1, 0, 1, 0]
    let dc = [0, -1, 0, 1]
    
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let rowCount = grid.count
        if rowCount == 0 {
            return -1
        }
        let columnCount = grid[0].count
        if columnCount == 0 {
            return -1
        }
        
        var grid = grid
        /* Mark all rotted */
        var rotted = [Int]() // (rowIndex * columnCount + columnIndex)
        var depth = [Int: Int]()
        for rowIndex in 0..<rowCount {
            let row = grid[rowIndex]
            for columnIndex in 0..<columnCount {
                let element = row[columnIndex]
                if element == 2 {
                    let index = rowIndex * columnCount + columnIndex
                    rotted.append(index)
                    depth[index] = 0
                }
            }
        }
        
        while !rotted.isEmpty {
            let index = rotted.removeFirst()
            let rowIndex = index / columnCount
            let columnIndex = index % columnCount
            for k in 0..<4 {
                let nRowIndex = rowIndex + dr[k]
                let nColumnIndex = columnIndex + dc[k]
                if 0 <= nRowIndex && nRowIndex < rowCount && 0 <= nColumnIndex && nColumnIndex < columnCount && grid[nRowIndex][nColumnIndex] == 1 {
                    grid[nRowIndex][nColumnIndex] = 2
                    let nIndex = nRowIndex * columnCount + nColumnIndex
                    rotted.append(nIndex)
                    depth[nIndex] = (depth[index]! + 1)
                }
            }
        }
        
        /* Find max depth */
        var times = 0
        for (_, v) in depth {
            times = max(times, v)
        }
        
        /* Check if all rotted */
        for row in grid {
            for element in row {
                if element == 1 {
                    return -1
                }
            }
        }
        
        return times
    }
    
    func test() -> Void {
        print(orangesRotting([[2,1,1],[1,1,0],[0,1,1]]))
        print(orangesRotting([[2,1,1],[0,1,1],[1,0,1]]))
        print(orangesRotting([[0,2]]))
        print(orangesRotting([[1,2,1,1,2,1,1]]))
    }
}
