//
//  MergeIntervals.swift
//  leetcode
//
//  Created by Henry on 2019/5/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MergeIntervalsSolution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 {
            return intervals
        }
        
        let sortedIntervals = intervals.sorted { (ele1, ele2) -> Bool in
            if ele1[0] < ele2[0] {
                return true
            } else if ele1[0] > ele2[0] {
                return false
            } else {
                return ele1[1] < ele2[1]
            }
        }
        
        var ret = [[Int]]()
        var previousInterval: [Int]? = nil
        for i in 0..<sortedIntervals.count {
            let currentInterval = sortedIntervals[i]
            if previousInterval == nil {
                previousInterval = sortedIntervals[i]
            } else {
                if currentInterval[0] > previousInterval![1] {
                    ret.append(previousInterval!)
                    previousInterval = currentInterval
                } else {
                    if currentInterval[1] <= previousInterval![1] {
                        continue
                    } else {
                        previousInterval![1] = currentInterval[1]
                    }
                }
            }
        }
        ret.append(previousInterval!)
        
        return ret
    }
    
    func test() -> Void {
        print(merge([[1,3],[2,6],[8,10],[15,18]]))
        print(merge([[1,4],[4,5]]))
    }
}
