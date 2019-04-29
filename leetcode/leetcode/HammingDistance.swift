//
//  HammingDistance.swift
//  leetcode
//
//  Created by Henry on 2019/4/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class HammingDistanceSolution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var z = x ^ y
        var distance = 0
        for _ in 0...(z.bitWidth - 1) {
            let v = z << 0
            if v & 1 == 1 {
                distance += 1
            }
            
            z = z >> 1
        }

        return distance
    }
    
    func test() -> Void {
        print(hammingDistance(1, 4))
    }
}
