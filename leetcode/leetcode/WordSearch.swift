//
//  WordSearch.swift
//  leetcode
//
//  Created by Henry on 2019/5/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class WordSearchSolution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rowCount = board.count
        if rowCount == 0 {
            return false
        }
        let columnCount = board[0].count
        if columnCount == 0 {
            return false
        }
        
        let wordChars = Array(word)
        var board = board
        var tmp = [Character]()
        for i in 0..<rowCount {
            for j in 0..<columnCount {
                if backTracking(&board, wordChars, &tmp, i, j) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func backTracking(_ board: inout [[Character]], _ target: [Character], _ tmp: inout [Character], _ rIndex: Int, _ cIndex: Int) -> Bool {
        if tmp.count == target.count {
            return true
        } else {
            if rIndex < 0 || cIndex < 0 || rIndex == board.count || cIndex == board[rIndex].count {
                return false
            }
            
            if board[rIndex][cIndex] != target[tmp.count] {
                return false
            }
            
            tmp.append(board[rIndex][cIndex])
            board[rIndex][cIndex] = "!"
            if backTracking(&board, target, &tmp, rIndex-1, cIndex) {
                return true
            }
            if backTracking(&board, target, &tmp, rIndex+1, cIndex) {
                return true
            }
            if backTracking(&board, target, &tmp, rIndex, cIndex-1) {
                return true
            }
            if backTracking(&board, target, &tmp, rIndex, cIndex+1) {
                return true
            }
            board[rIndex][cIndex] = tmp.last!
            tmp.removeLast()
            
            return false
        }
    }
    
    func test() -> Void {
        print(exist([["A","B","C","E"],
                     ["S","F","C","S"],
                     ["A","D","E","E"]], "ABCCED"))
        print(exist([["A","B","C","E"],
                     ["S","F","C","S"],
                     ["A","D","E","E"]], "SEE"))
        print(exist([["A","B","C","E"],
                     ["S","F","C","S"],
                     ["A","D","E","E"]], "ABCB"))
        print(exist([["a","b"]], "ba"))
        print(exist([["a","b"],["c","d"]], "abcd"))
        print(exist([["a","b","b","a","b"],
                     ["a","a","b","b","a"],
                     ["a","a","a","a","b"],
                     ["a","a","a","b","a"],
                     ["a","a","a","a","a"],
                     ["a","b","a","b","b"],
                     ["a","b","b","a","b"]],"abbbbaababaa"))
    }
}
