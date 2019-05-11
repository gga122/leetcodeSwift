//
//  ImageSmoother.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ImageSmootherSolution {
    func imageSmoother(_ M: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        for i in 0 ..< M.count {
            var tmp = [Int]()
            let row = M[i]
            for j in 0 ..< row.count {
                var sum = row[j] // mid
                var count = 1
                if j > 0 { // left
                    sum += row[j - 1]
                    count += 1
                }
                if j < row.count - 1 { // right
                    sum += row[j + 1]
                    count += 1
                }
                if i > 0 { // top
                    sum += M[i - 1][j]
                    count += 1
                }
                if i < M.count - 1 { // bottom
                    sum += M[i + 1][j]
                    count += 1
                }
                if j > 0 && i > 0 { // left top
                    sum += M[i - 1][j - 1]
                    count += 1
                }
                if j > 0 && i < M.count - 1 { // left bottom
                    sum += M[i + 1][j - 1]
                    count += 1
                }
                if j < row.count - 1 && i > 0 { // right top
                    sum += M[i - 1][j + 1]
                    count += 1
                }
                if j < row.count - 1 && i < M.count - 1 { // right bottom
                    sum += M[i + 1][j + 1]
                    count += 1
                }
                tmp.append(sum / count)
            }
            res.append(tmp)
        }
        return res
    }
    
    func test() -> Void {
        print(imageSmoother([[1, 1, 1], [1, 0, 1], [1, 1, 1]]))
    }
}
