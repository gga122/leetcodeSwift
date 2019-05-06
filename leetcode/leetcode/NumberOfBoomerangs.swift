//
//  NumberOfBoomerangs.swift
//  leetcode
//
//  Created by Henry on 2019/5/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NumberOfBoomerangsSolution {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        var count = 0
        var i = 0
        var hashs = [Int: Int]()
        
        while i < points.count {
            var j = 0
            while j < points.count {
                if i != j {
                    let d1 = points[i][0] - points[j][0]
                    let d2 = points[i][1] - points[j][1]
                    let dis = d1 * d1 + d2 * d2
                    if let v = hashs[dis] {
                        count += 2 * v
                        hashs[dis] = v + 1
                    } else {
                        hashs[dis] = 1
                    }
                }
                j += 1
            }
            hashs.removeAll()
            i += 1
        }
        
        return count
    }
    
    func test() -> Void {
        print(numberOfBoomerangs([[0, 0], [1, 0], [2, 0]]))
    }
}
