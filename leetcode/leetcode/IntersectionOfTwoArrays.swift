//
//  IntersectionOfTwoArrays.swift
//  leetcode
//
//  Created by Henry on 2019/5/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class IntersectionOfTwoArraysSolution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count == 0 || nums2.count == 0 {
            return []
        }
        
        var setA = Set<Int>.init()
        for n in nums1 {
            setA.insert(n)
        }
        var setB = Set<Int>.init()
        for m in nums2 {
            if setA.contains(m) {
                setB.insert(m)
            }
        }
        
        return setB.map{$0}
    }
    
    func test() -> Void {
        print(intersection([1, 2, 2, 1], [2, 2]))
        print(intersection([4, 9, 5], [9, 4, 9, 8, 4]))
    }
}
