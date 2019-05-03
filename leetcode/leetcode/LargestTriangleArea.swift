//
//  LargestTriangleArea.swift
//  leetcode
//
//  Created by Henry on 2019/5/4.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LargestTriangleAreaSolution {
    func largestTriangleArea(_ points: [[Int]]) -> Double {
        if points.count < 3 {
            return 0
        }
        
        var ret = 0.0
        
        var i = 0
        while i < points.count {
            var j = i + 1
            while j < points.count {
                var k = j + 1
                while k < points.count {
                    let x1 = points[i][0]
                    let y1 = points[i][1]
                    let x2 = points[j][0]
                    let y2 = points[j][1]
                    let x3 = points[k][0]
                    let y3 = points[k][1]
                    let area = abs((x1 - x3) * (y2 - y3) - (x2 - x3) * (y1 - y3))
                    ret = max(ret, Double(area))
                    k += 1
                }
                j += 1
            }
            i += 1
        }
        
        return ret / 2 
    }
    
    func test() -> Void {
        print(largestTriangleArea([[0, 0], [0, 1], [1, 0], [0, 2], [2, 0]]))
    }
}
