//
//  FriendCircles.swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FriendCirclesSolution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        if M.count <= 1 {
            return M.count
        }
        
        var relations = Array<Int>.init(sequence(first: 0, next: { (cur) -> Int? in
            cur < M.count - 1 ? cur + 1 : nil
        }))
        
        for i in 0..<M.count {
            for j in 0...i {
                if M[i][j] == 0 {
                    continue
                }
                
                merge(&relations, i, j)
            }
        }
        
        var count = 0
        for i in 0..<relations.count {
            if relations[i] == i {
                count += 1
            }
        }
        
        return count
    }
    
    func merge(_ relations: inout [Int], _ v: Int, _ u: Int) -> Void {
        let t1 = find(&relations, v)
        let t2 = find(&relations, u)
        
        if t1 != t2 {
            relations[t2] = t1
        }
    }
    
    func find(_ relations: inout [Int], _ v: Int) -> Int {
        if relations[v] == v {
            return v
        }
        
        relations[v] = find(&relations, relations[v])
        return relations[v]
    }
    
    func test() -> Void {
        print(findCircleNum([[1,1,0],
                             [1,1,0],
                             [0,0,1]]))
        print(findCircleNum([[1,1,0],
                             [1,1,1],
                             [0,1,1]]))
    }
}
