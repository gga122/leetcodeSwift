//
//  BattleshipsInABoard.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BattleshipsInABoardSolution {
    func countBattleships(_ board: [[Character]]) -> Int {
        var ret = 0
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "X" {
                    if i - 1 >= 0 {
                        if board[i - 1][j] == "X" {
                            continue
                        }
                    }
                    if j - 1 >= 0 {
                        if board[i][j - 1] == "X" {
                            continue
                        }
                    }
                    
                    ret += 1
                }
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(countBattleships([["X",".",".","X"],[".",".",".","X"],[".",".",".","X"]]))
        print(countBattleships([[".","."],["X","X"]]))
    }
}
