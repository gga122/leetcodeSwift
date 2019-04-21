//
//  AvailableCapturesForRook.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AvailableCapturesForRookSolution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var rRow = -1
        var rColumn = -1
        var i = 0
        var foundRook = false
        while i < 8 {
            let row = board[i]
            var j = 0
            while j < 8 {
                let c = row[j]
                if c == "R" {
                    rRow = i
                    rColumn = j
                    foundRook = true
                    break;
                }
                
                j += 1
            }
            if foundRook {
                break;
            }
            
            i += 1
        }
        if rRow == -1 || rColumn == -1 {
            return 0
        }
        
        var count = 0
        
        var s = rRow - 1
        while s >= 0 {
            let v = board[s][rColumn]
            if v == "p" {
                count += 1
                break
            } else if v == "B" {
                break
            }
            s -= 1
        }
        s = rRow + 1
        while s < 8 {
            let v = board[s][rColumn]
            if v == "p" {
                count += 1
                break
            } else if v == "B" {
                break
            }
            s += 1
        }
        s = rColumn - 1
        while s >= 0 {
            let v = board[rRow][s]
            if v == "p" {
                count += 1
                break
            } else if v == "B" {
                break
            }
            s -= 1
        }
        s = rColumn + 1
        while s < 8 {
            let v = board[rRow][s]
            if v == "p" {
                count += 1
                break
            } else if v == "B" {
                break
            }
            s += 1
        }
        
        return count
    }
    
    func test() -> Void {
        print(numRookCaptures([[".",".",".",".",".",".",".","."],
                               [".",".",".","p",".",".",".","."],
                               [".",".",".","R",".",".",".","p"],
                               [".",".",".",".",".",".",".","."],
                               [".",".",".",".",".",".",".","."],
                               [".",".",".","p",".",".",".","."],
                               [".",".",".",".",".",".",".","."],
                               [".",".",".",".",".",".",".","."]]))
        print(numRookCaptures([[".",".",".",".",".",".",".","."],
                               [".","p","p","p","p","p",".","."],
                               [".","p","p","B","p","p",".","."],
                               [".","p","B","R","B","p",".","."],
                               [".","p","p","B","p","p",".","."],
                               [".","p","p","p","p","p",".","."],
                               [".",".",".",".",".",".",".","."],
                               [".",".",".",".",".",".",".","."]]))
        print(numRookCaptures([[".",".",".",".",".",".",".","."],
                               [".",".",".","p",".",".",".","."],
                               [".",".",".","p",".",".",".","."],
                               ["p","p",".","R",".","p","B","."],
                               [".",".",".",".",".",".",".","."],
                               [".",".",".","B",".",".",".","."],
                               [".",".",".","p",".",".",".","."],
                               [".",".",".",".",".",".",".","."]]))
    }
}
