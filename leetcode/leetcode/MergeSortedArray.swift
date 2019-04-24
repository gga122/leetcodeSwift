//
//  MergeSortedArray.swift
//  leetcode
//
//  Created by Henry on 2019/4/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MergeSortedArraySolution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> Void {
        if m == 0 {
            var index = 0
            while index < nums2.count {
                nums1[index] = nums2[index]
                index += 1
            }
            return
        }
        
        var i = n - 1
        var j = m - 1
        var k = m + n - 1
        while i >= 0 && j >= 0 {
            if nums1[j] < nums2[i] {
                nums1[k] = nums2[i]
                i -= 1
            } else {
                nums1[k] = nums1[j]
                j -= 1
            }
            k -= 1
        }
        
        while i >= 0 {
            nums1[k] = nums2[i]
            k -= 1
            i -= 1
        }
    }
    
    func test() -> Void {
        var num1 = [1, 2, 3, 0, 0, 0]
        merge(&num1, 3, [2, 5, 6], 3)
        var num2 = [0]
        merge(&num2, 0, [1], 1)
        var num3 = [2, 0]
        merge(&num3, 1, [1], 1)
    }
}
