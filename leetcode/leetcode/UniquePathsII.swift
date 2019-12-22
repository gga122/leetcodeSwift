//
//  UniquePathsII.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UniquePathsIISolution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid[0][0] == 1 || obstacleGrid.last!.last! == 1 {
            return 0
        }
        
        var result = [[Int]].init(repeating: [Int].init(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        result[0][0] = 1
        for j in 1..<obstacleGrid[0].count {
            if obstacleGrid[0][j] == 1 {
                break;
            }
            
            result[0][j] = 1
        }
        for i in 1..<obstacleGrid.count {
            if obstacleGrid[i][0] == 1 {
                break;
            }
            result[i][0] = 1
        }

        for i in 1..<obstacleGrid.count {
            for j in 1..<obstacleGrid[i].count {
                if obstacleGrid[i][j] == 1 {
                    result[i][j] = 0
                } else {
                    result[i][j] = result[i-1][j] + result[i][j-1] 
                }
            }
        }
        
        return result.last!.last!
    }
    
    func test() -> Void {
        print(uniquePathsWithObstacles([[0,0,0],
                                        [0,1,0],
                                        [0,0,0]]))
        print(uniquePathsWithObstacles([[0,0]]))
    }
}
