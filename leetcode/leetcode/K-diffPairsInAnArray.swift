//
//  K-diffPairsInAnArray.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class K_diffPairsInAnArraySolution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        if nums.count <= 1 {
            return 0
        }
        
        let sorted = nums.sorted()
        
        var count = 0
        var p0 = 0
        var p1 = 1
        while p0 < sorted.count && p1 < sorted.count {
            let distance = sorted[p1] - sorted[p0]
            if distance < k {
                var tp = p1+1
                while tp < sorted.count && sorted[p1] == sorted[tp] {
                    tp += 1
                }
                
                p1 = tp
                if p1 >= sorted.count {
                    break
                }
            }  else {
                if distance == k {
                    count += 1
                }
                var tp = p0+1
                while tp < sorted.count && sorted[p0] == sorted[tp] {
                    tp += 1
                }
                
                p0 = tp
                if p0 >= sorted.count-1 {
                    break
                }
                if p0 >= p1 {
                    p1 = p0+1
                }
            }
        }
        
        return count
    }
    
    func test() -> Void {
        print(findPairs([3, 1, 4, 1, 5], 2))
        print(findPairs([1, 2, 3, 4, 5], 1))
        print(findPairs([1, 3, 1, 5, 4], 0))
    }
}
