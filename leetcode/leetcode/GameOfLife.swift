//
//  GameOfLife.swift
//  leetcode
//
//  Created by MickyZhu on 19/12/2019.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class GameOfLifeSolution {
    func gameOfLife(_ board: inout [[Int]]) {
        let sBoard = board
        
        for i in 0..<sBoard.count {
            for j in 0..<sBoard[i].count {
                board[i][j] = checkAtPoint(sBoard, i, j)
            }
        }
    }
    
    func checkAtPoint(_ board: [[Int]], _ x: Int, _ y: Int) -> Int {
        let xMax = board.count
        let yMax = board[0].count
        let xMin = 0
        let yMin = 0
        
        var deadCount = 0
        var liveCount = 0

        for i in (x-1)...x+1 {
            if i < xMin || i >= xMax {
                continue
            }
            
            for j in (y-1)...(y+1) {
                if j < yMin || j >= yMax {
                    continue
                }
                if i == x && j == y {
                    continue
                }
                
                if board[i][j] == 1 {
                    liveCount += 1
                } else {
                    deadCount += 1
                }
            }
        }
                
        if board[x][y] == 1 {
            if liveCount == 2 || liveCount == 3 {
                return 1
            } else {
                return 0
            }
        } else {
            if liveCount == 3 {
                return 1
            } else {
                return 0
            }
        }
    }
    
    func test() -> Void {
        var board = [[0,1,0],
                     [0,0,1],
                     [1,1,1],
                     [0,0,0]]
        gameOfLife(&board)
        print(board)
    }
}
