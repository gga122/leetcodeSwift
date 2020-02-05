//
//  MaximumDistanceInArrays.swift
//  leetcode
//
//  Created by MickyZhu on 6/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MaximumDistanceInArraysSolution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        if arrays.count <= 1 {
            return 0
        }
        
        var minVal = arrays[0].first!
        var maxVal = arrays[0].last!
        var res = Int.min
        
        for i in 1..<arrays.count {
            let array = arrays[i]
            
            let dis1 = abs(array.first! - maxVal)
            let dis2 = abs(array.last! - minVal)
            res = max(dis1, dis2, res)
            
            minVal = min(minVal, array.first!)
            maxVal = max(maxVal, array.last!)
        }
        
        return res
    }
    
    func test() -> Void {
        print(maxDistance([[1,2,3],
                           [4,5],
                           [1,2,3]]))
    }
}
