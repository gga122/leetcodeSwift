//
//  FindTheTownJudge.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindTheTownJudgeSolution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var inDegrees = Array<Int>.init(repeating: 0, count: N)
        var outDegrees = Array<Int>.init(repeating: 0, count: N)
        
        /* Use directed graph, Judge's indegree is `N - 1` AND outdegree is 0 */
        for singleTrust in trust {
            let outDegree = singleTrust[0] - 1
            let inDegree = singleTrust[1] - 1
            
            inDegrees[inDegree] += 1
            outDegrees[outDegree] += 1
        }
        for i in 0..<N {
            if (inDegrees[i] == N - 1) && (outDegrees[i] == 0) {
                return i + 1
            }
        }
        return -1
    }
    
    func test() -> Void {
        print(findJudge(2, [[1, 2]]))
        print(findJudge(3, [[1, 3], [2, 3]]))
        print(findJudge(3, [[1, 3], [2, 3], [3, 1]]))
        print(findJudge(3, [[1, 2], [2, 3]]))
        print(findJudge(4, [[1, 3], [1, 4], [2, 3], [2, 4], [4, 3]]))
    }
}
