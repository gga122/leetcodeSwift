//
//  ValidBoomerang.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ValidBoomerangSolution {
    func isBoomerang(_ points: [[Int]]) -> Bool {
        let p0 = points[0]
        let p1 = points[1]
        let p2 = points[2]
        let vector1 = [p1[0] - p0[0], p1[1] - p0[1]]
        let vector2 = [p2[0] - p0[0], p2[1] - p0[1]]

        if vector1[0] * vector2[1] == vector1[1] * vector2[0] {
            return false
        }
        return true
    }
    
    func test() -> Void {
        print(isBoomerang([[1, 1], [2, 3], [3, 2]]))
        print(isBoomerang([[1, 1], [2, 2], [3, 3]]))
    }
}
