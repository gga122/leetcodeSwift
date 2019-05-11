//
//  FloodFill.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FloodFillSolution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let rowCount = image.count
        let columnCount = image[0].count
        var image = image
        var points = [(Int, Int)]()
        points.append((sr, sc))
        let oldColor = image[sr][sc]
        while !points.isEmpty {
            let point = points.popLast()!
            let rowIndex = point.0
            let columnIndex = point.1
            let color = image[rowIndex][columnIndex]
            if color != oldColor || color == newColor {
                continue
            }
            image[rowIndex][columnIndex] = newColor
            if rowIndex - 1 >= 0 {
                points.append((rowIndex - 1, columnIndex))
            }
            if rowIndex + 1 < rowCount {
                points.append((rowIndex + 1, columnIndex))
            }
            if columnIndex - 1 >= 0 {
                points.append((rowIndex, columnIndex - 1))
            }
            if columnIndex + 1 < columnCount {
                points.append((rowIndex, columnIndex + 1))
            }
        }
        
        return image
    }
    
    func test() -> Void {
        print(floodFill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2))
    }
}
