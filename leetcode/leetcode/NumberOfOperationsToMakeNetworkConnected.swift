//
//  NumberOfOperationsToMakeNetworkConnected.swift
//  leetcode
//
//  Created by Henry on 2020/1/13.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class NumberOfOperationsToMakeNetworkConnectedSolution {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        if connections.count < n - 1 {
            return -1
        }
        
        var father = [Int].init(repeating: 0, count: n)
        for i in 0..<father.count {
            father[i] = i
        }
        
        var groupCount = n
        var count = 0
        for connection in connections {
            let a = connection[0]
            let b = connection[1]
            if find(&father, a) == find(&father, b) {
                count += 1
            } else {
                let res = union(&father, a, b)
                if res {
                    groupCount -= 1
                }
            }
        }
        
        if count < groupCount - 1 {
            return -1
        }
        return groupCount - 1
    }
    
    func find(_ father: inout [Int], _ p: Int) -> Int {
        if p != father[p] {
            father[p] = find(&father, father[p])
        }
        return father[p]
    }
    
    func union(_ father: inout [Int], _ p: Int, _ q: Int) -> Bool {
        let i = find(&father, p)
        let j = find(&father, q)
        if i == j {
            return false
        }
        
        father[i] = j
        return true
    }
    
    func test() -> Void {
        print(makeConnected(4, [[0,1],[0,2],[1,2]]))
        print(makeConnected(6, [[0,1],[0,2],[0,3],[1,2],[1,3]]))
        print(makeConnected(6, [[0,1],[0,2],[0,3],[1,2]]))
        print(makeConnected(5, [[0,1],[0,2],[3,4],[2,3]]))
    }
}
