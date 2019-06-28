//
//  ValidSudoku.swift
//  leetcode
//
//  Created by Henry on 2019/6/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ValidSudokuSolution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowHashs =  Array<Set<Character>>.init(repeating: Set.init(), count: 9)
        var columnHashs = Array<Set<Character>>.init(repeating: Set.init(), count: 9)
        var gridHashs = Array<Array<Set<Character>>>.init(repeating: Array.init(repeating: Set.init(), count: 3), count: 3)
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                let v = board[row][column]
                if v == "." {
                    continue
                }
                
                if rowHashs[row].contains(v) {
                    return false
                } else {
                    rowHashs[row].insert(v)
                }
                
                if columnHashs[column].contains(v) {
                    return false
                } else {
                    columnHashs[column].insert(v)
                }
                
                let gridRowIndex = row / 3;
                let gridColumnIndex = column / 3;
                if gridHashs[gridRowIndex][gridColumnIndex].contains(v) {
                    return false
                } else {
                    gridHashs[gridRowIndex][gridColumnIndex].insert(v)
                }
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(isValidSudoku([["5","3",".",".","7",".",".",".","."],
                             ["6",".",".","1","9","5",".",".","."],
                             [".","9","8",".",".",".",".","6","."],
                             ["8",".",".",".","6",".",".",".","3"],
                             ["4",".",".","8",".","3",".",".","1"],
                             ["7",".",".",".","2",".",".",".","6"],
                             [".","6",".",".",".",".","2","8","."],
                             [".",".",".","4","1","9",".",".","5"],
                             [".",".",".",".","8",".",".","7","9"]]))
        print(isValidSudoku([["8","3",".",".","7",".",".",".","."],
                             ["6",".",".","1","9","5",".",".","."],
                             [".","9","8",".",".",".",".","6","."],
                             ["8",".",".",".","6",".",".",".","3"],
                             ["4",".",".","8",".","3",".",".","1"],
                             ["7",".",".",".","2",".",".",".","6"],
                             [".","6",".",".",".",".","2","8","."],
                             [".",".",".","4","1","9",".",".","5"],
                             [".",".",".",".","8",".",".","7","9"]]))
    }
}
