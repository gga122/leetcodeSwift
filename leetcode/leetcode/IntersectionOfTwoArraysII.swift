//
//  IntersectionOfTwoArraysII.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class IntersectionOfTwoArraysIISolution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count == 0 || nums2.count == 0 {
            return []
        }
        
        var hashs = [Int: Int]()
        for n in nums1 {
            if let count = hashs[n] {
                hashs[n] = count + 1
            } else {
                hashs[n] = 1
            }
        }
        
        var ret = [Int]()
        for n in nums2 {
            if let count = hashs[n] {
                ret.append(n)
                if count == 1 {
                    hashs.removeValue(forKey: n)
                } else {
                    hashs[n] = count - 1
                }
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(intersect([1, 2, 2, 1], [2, 2]))
        print(intersect([4, 9, 5], [9, 4, 9, 8, 4]))
    }
}
