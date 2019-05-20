//
//  QueueReconstructionByHeight.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class QueueReconstructionByHeightSolution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        if people.count <= 1 {
            return people
        }
    
        /* Sort with height decrease and K increase */
        let sorted = people.sorted { (ele1, ele2) -> Bool in
            if ele1[0] < ele2[0] {
                return false
            } else if ele1[0] > ele2[0] {
                return true
            } else {
                return ele1[1] < ele2[1]
            }
        }
        
        var ret = [[Int]]()
        for ele in sorted {
            ret.insert(ele, at: ele[1])
        }
        
        return ret
    }
    
    func test() -> Void {
        print(reconstructQueue([[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]))
    }
}
