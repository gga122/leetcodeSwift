//
//  RectangleOverlap.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RectangleOverlapSolution {
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        let x1 = rec1[0]; let y1 = rec1[1]
        let x2 = rec1[2]; let y2 = rec1[3]
        let x3 = rec2[0]; let y3 = rec2[1]
        let x4 = rec2[2]; let y4 = rec2[3]
        
        if x1 == x2 || y1 == y2 {
            return false
        }
        if x3 == x4 || y1 == y4 {
            return false
        }
        
        return !(x1 >= x4 || y1 >= y4 || x2 <= x3 || y2 <= y3)
    }
    
    func test() -> Void {
        print(isRectangleOverlap([0,0,2,2], [1,1,3,3]))
        print(isRectangleOverlap([0,0,1,1], [1,0,2,1]))
    }
}
