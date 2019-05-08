//
//  MatrixCellsInDistanceOrder.swift
//  leetcode
//
//  Created by Henry on 2019/5/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MatrixCellsInDistanceOrderSolution {
    
    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var ret = [[Int]]()
        let maxDistance = max(max(r0 + c0, R + C - 2 - r0 - c0), max(R - 1 - r0 + c0, C - 1 - c0 + r0))
        ret.append([r0, c0])
        var dis = 1
        while dis <= maxDistance {
            /* Top Center */
            if check(r0 - dis, c0, R, C) { 
                ret.append([r0 - dis, c0])
            }
            /* Bottom Center */
            if check(r0 + dis, c0, R, C) {
                ret.append([r0 + dis, c0])
            }
            /* Left Center */
            if check(r0, c0 - dis, R, C) {
                ret.append([r0, c0 - dis])
            }
            /* Right Center */
            if check(r0, c0 + dis, R, C) {
                ret.append([r0, c0 + dis])
            }
            
            var i = 1
            while i < dis {
                /* Bottom Right */
                if check(r0 + i, c0 + dis - i, R, C) {
                    ret.append([r0 + i, c0 + dis - i])
                }
                /* Bottom Left */
                if check(r0 + i, c0 - dis + i, R, C) {
                    ret.append([r0 + i, c0 - dis + i])
                }
                /* Top Right */
                if check(r0 - i, c0 + dis - i, R, C) {
                    ret.append([r0 - i, c0 + dis - i])
                }
                /* Top Left */
                if check(r0 - i, c0 - dis + i, R, C) {
                    ret.append([r0 - i, c0 - dis + i])
                }
                i += 1
            }
            dis += 1
        }
        
        return ret
    }
    
    func check(_ x: Int, _ y: Int, _ boundX: Int, _ boundY: Int) -> Bool {
        return (x >= 0 && y >= 0 && x < boundX && y < boundY)
    }
    
    func test() -> Void {
        print(allCellsDistOrder(1, 2, 0, 0))
        print(allCellsDistOrder(2, 2, 0, 1))
        print(allCellsDistOrder(2, 3, 1, 2))
    }
}
