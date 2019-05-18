//
//  AllPathsFromSourceToTarget.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AllPathsFromSourceToTargetSolution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        if graph.count == 0 {
            return []
        }
        if graph[0].count == 0 {
            return []
        }
        
        var ret = [[Int]]()
        backTracking(&ret, graph, [], 0)
        
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ graph: [[Int]], _ tmp: [Int], _ nodeIndex: Int) -> Void {
        var tmp = tmp
        tmp.append(nodeIndex)
        if nodeIndex == graph.count - 1 {
            result.append(tmp)
        } else {
            let nextIndexes = graph[nodeIndex]
            for nextIndex in nextIndexes {
                backTracking(&result, graph, tmp, nextIndex)
            }
        }
    }
    
    func test() -> Void {
        print(allPathsSourceTarget([[1,2],[3],[3],[]]))
    }
}
