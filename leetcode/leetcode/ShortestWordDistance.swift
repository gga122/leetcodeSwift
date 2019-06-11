//
//  ShortestWordDistance.swift
//  leetcode
//
//  Created by Henry on 2019/6/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ShortestWordDistanceSolution {
    func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var index1 = -1
        var index2 = -1
        
        var minDis = Int.max
        for i in 0..<words.count {
            if words[i] == word1 {
                index1 = i
                if index2 >= 0 {
                    minDis = min(minDis, abs(index1-index2))
                }
            } else if words[i] == word2 {
                index2 = i
                if index1 >= 0 {
                    minDis = min(minDis, abs(index1-index2))
                }
            }
        }
        
        return minDis
    }
    
    func test() -> Void {
        print(shortestDistance(["practice", "makes", "perfect", "coding", "makes"], "coding", "practice"))
        print(shortestDistance(["practice", "makes", "perfect", "coding", "makes"], "coding", "makes"))
    }
}
