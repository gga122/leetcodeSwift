//
//  DeleteColumnsToMakeSorted.swift
//  leetcode
//
//  Created by Henry on 2019/5/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DeleteColumnsToMakeSortedSolution {
    func minDeletionSize(_ A: [String]) -> Int {
        var allChars = [[Character]]()
        for str in A {
            allChars.append(Array(str))
        }
        
        let columnCount = allChars.first!.count
        var columnIndex = 0
        var indexes = [Int]()
        let rowCount = allChars.count
        while columnIndex < columnCount {
            var cValue = allChars[0][columnIndex].unicodeScalars.first!.value
            var rowIndex = 1
            while rowIndex < rowCount {
                let value = allChars[rowIndex][columnIndex].unicodeScalars.first!.value
                if cValue.distance(to: value) < 0 {
                    indexes.append(columnIndex)
                    break
                }

                cValue = value
                rowIndex += 1
            }
            
            columnIndex += 1
        }
        
        return indexes.count
    }
    
    func test() -> Void {
        print(minDeletionSize(["cba", "daf", "ghi"]))
        print(minDeletionSize(["a", "b"]))
        print(minDeletionSize(["zyx", "wvu", "tsr"]))
    }
}
