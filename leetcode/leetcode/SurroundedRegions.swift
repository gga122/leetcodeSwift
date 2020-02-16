//
//  SurroundedRegions.swift
//  leetcode
//
//  Created by MickyZhu on 16/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class SurroundedRegionsSolution {
    func solve(_ board: inout [[Character]]) {
        let m = board.count
        if m <= 1 {
            return
        }
        let n = board[0].count
        if n <= 1 {
            return
        }
        
        for i in 0..<m {
            for j in 0..<n {
                let isEdge = i == 0 || j == 0 || i == m-1 || j == n-1
                if isEdge && board[i][j] == "O" {
                    bfs(&board, i, j)
                }
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                }
                if board[i][j] == "#" {
                    board[i][j] = "O"
                }
            }
        }
    }
    
    func bfs(_ board: inout [[Character]], _ i: Int, _ j: Int) -> Void {
        var queue = [(Int, Int)]()
        queue.append((i, j))
        board[i][j] = "#"
        
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let i = pos.0
            let j = pos.1
            
            // Top
            if i-1 >= 0 && board[i-1][j] == "O" {
                queue.append((i-1, j))
                board[i-1][j] = "#"
            }
            // Bottom
            if i+1 < board.count && board[i+1][j] == "O" {
                queue.append((i+1, j))
                board[i+1][j] = "#"
            }
            // Left
            if j-1 >= 0 && board[i][j-1] == "O" {
                queue.append((i, j-1))
                board[i][j-1] = "#"
            }
            // Right
            if j+1 < board[0].count && board[i][j+1] == "O" {
                queue.append((i, j+1))
                board[i][j+1] = "#"
            }
        }
    }
    
    func test() -> Void {
        var b1: [[Character]] = [["X","X","X","X"],
                                 ["X","O","O","X"],
                                 ["X","X","O","X"],
                                 ["X","O","X","X"]]
        solve(&b1)
        print(b1)
    }
}
