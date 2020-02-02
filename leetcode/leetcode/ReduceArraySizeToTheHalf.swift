//
//  ReduceArraySizeToTheHalf.swift
//  leetcode
//
//  Created by MickyZhu on 2/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ReduceArraySizeToTheHalfSolution {
    func minSetSize(_ arr: [Int]) -> Int {
        var map = [Int: Int]()
        for num in arr {
            if let count = map[num] {
                map[num] = count + 1
            } else {
                map[num] = 1
            }
        }
        
        let sorted = map.sorted { (kv1, kv2) -> Bool in
            return kv1.value > kv2.value
        }
        
        var count = 0
        for i in 0..<sorted.count {
            let kv = sorted[i]
            count += kv.value
            if count >= arr.count / 2 {
                return i+1
            }
        }
        
        return 0
    }
    
    func test() -> Void {
        print(minSetSize([3,3,3,3,5,5,5,2,2,7]))
    }
}
