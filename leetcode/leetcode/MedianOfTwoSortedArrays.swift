//
//  MedianOfTwoSortedArrays.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MedianOfTwoSortedArraysSolution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1 = nums1
        var nums2 = nums2
        if nums1.count > nums2.count {
            let tmp = nums1
            nums1 = nums2
            nums2 = tmp
        }
        
        var iMin = 0
        var iMax = nums1.count
        let half = (nums1.count + nums2.count + 1) / 2
        while iMin <= iMax {
            let i = (iMin + iMax) / 2
            let j = half - i
            if i < iMax && nums2[j - 1] > nums1[i] {
                iMin = i + 1
            } else if i > iMin && nums1[i - 1] > nums2[j] {
                iMax = i - 1
            } else {
                var maxLeft = 0
                if i == 0 {
                    maxLeft = nums2[j - 1]
                } else if j == 0 {
                    maxLeft = nums1[i - 1]
                } else {
                    maxLeft = max(nums1[i - 1], nums2[j - 1])
                }
                if (nums1.count + nums2.count) % 2 == 1 {
                    return Double(maxLeft)
                }
                
                var minRight = 0
                if i == nums1.count {
                    minRight = nums2[j]
                } else if (j == nums2.count) {
                    minRight = nums1[i]
                } else {
                    minRight = min(nums1[i], nums2[j])
                }
                
                return Double(minRight + maxLeft) / 2.0
            }
        }
        
        return 0.0
    }
    
    func test() -> Void {
        print(findMedianSortedArrays([1, 3], [2]))
        print(findMedianSortedArrays([1, 2], [3, 4]))
    }
}
