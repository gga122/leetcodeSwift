//
//  IntersectionOfThreeSortedArrays.swift
//  leetcode
//
//  Created by MickyZhu on 5/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class IntersectionOfThreeSortedArraysSolution {
    func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var res = [Int]()
        
        let hash1 = Set<Int>.init(arr2)
        let hash2 = Set<Int>.init(arr3)
        
        for n in arr1 {
            if hash1.contains(n) && hash2.contains(n) {
                res.append(n)
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(arraysIntersection([1,2,3,4,5], [1,2,5,7,9], [1,3,4,5,8]))
    }
}
