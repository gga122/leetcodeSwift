//
//  1222.swift
//  LeetCode
//
//  Created by henry on 2024/11/17.
//

import Foundation

class Solution_1222 {
    func queensAttacktheKing(_ queens: [[Int]], _ king: [Int]) -> [[Int]] {
        /**
         1. 国际象棋中, 皇后可以横/竖/斜吃子, 直接考虑从国王的坐标反推能命中的皇后
         2. 考虑到皇后的摆放可能会阻挡其他皇后, 题意要求能直接攻击, 被阻挡的皇后不能统计
         3. (x,y) 可以考虑以 8*x+y 的形态表示
         4. 使用单位长度来表示方向, 例如 (0, -1) 表示向上 / (1, 0) 表示向右
         */
        var canAttacked = [[Int]]()
        var queenMap = [Int: [Int]]()
        for queen in queens {
            let key = queen[0]*8+queen[1]
            queenMap[key] = queen
        }
        
        let directions = [[0,-1], [0,1], [-1, 0], [1,0], [-1,-1], [-1, 1], [1, -1], [1,1]] // 上/下/左/右/左上/左下/右上/右下
        for direction in directions {
            var start = king
            /**
             只要还在棋盘内, 就保持循环
             */
            while 0 <= start[0], start[0] < 8, 0 <= start[1], start[1] < 8 {
                let key = start[0]*8+start[1]
                if let val = queenMap[key] {
                    canAttacked.append(val)
                    /**
                     只要找到最近的一个即可
                     */
                    break
                }
                start[0] += direction[0]
                start[1] += direction[1]
            }
        }
        
        return canAttacked
    }
}
