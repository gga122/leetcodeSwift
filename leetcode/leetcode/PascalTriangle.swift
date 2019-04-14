//
//  PascalTriangle.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PascalTriangleSolution {
    func getElement(_ rowIndex: Int, _ index: Int) -> Int {
        if rowIndex == 0 {
            return 1
        }
        if index == 0 || index == rowIndex {
            return 1
        }
        
        return getElement(rowIndex - 1, index - 1) + getElement(rowIndex - 1, index)
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = Array<Int>.init()
        for idx in 0...rowIndex {
            row.insert(getElement(rowIndex, idx), at: idx)
        }
        
        return row
    }
    
    func generate(_ numRows: Int) -> [[Int]] {
        var rows = Array<Array<Int>>.init()
        for idx in 0..<numRows {
            if idx == 0 {
                rows.append([1])
            } else if (idx == 1) {
                rows.append([1, 1])
            } else {
                let lastRow = rows[idx - 1]
                var row = Array<Int>.init()
                for i in 0...idx {
                    if i == 0 || i == idx {
                        row.append(1)
                    } else {
                        row.insert(lastRow[i] + lastRow[i - 1], at: i)
                    }
                }
                rows.append(row)
            }
        }
        
        return rows
    }
    
    func testGenerator() -> Void {
        print(generate(5))
    }
}
