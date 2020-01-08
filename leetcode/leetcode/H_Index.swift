//
//  H_Index.swift
//  leetcode
//
//  Created by mickyzhu on 2020/1/8.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class H_IndexSolution {
    func hIndex(_ citations: [Int]) -> Int {
        let citations = citations.sorted()
        
        for i in 0..<citations.count {
            let h = citations.count - i
            if h <= citations[i] {
                return h
            }
        }
        
        return 0
    }
    
    func test() -> Void {
        print(hIndex([3,0,6,1,5]))
        print(hIndex([]))
        print(hIndex([100]))
        print(hIndex([0]))
    }
}
