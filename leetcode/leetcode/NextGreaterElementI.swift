//
//  NextGreaterElementI.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NextGreaterElementISolution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count == 0 || nums2.count == 0 {
            return []
        }
        
        var stack = [Int]()
        var dic = [Int: Int]()
        for n in nums2 {
            if stack.isEmpty {
                stack.append(n)
            } else {
                /* Pop all values in stack which less than current value and map them. */
                while let peek = stack.last {
                    if peek < n {
                        dic[stack.removeLast()] = n
                    } else {
                        break
                    }
                }
                
                stack.append(n)
            }
        }
        
        var ret = [Int]()
        for m in nums1 {
            ret.append(dic[m] ?? -1)
        }
        
        return ret
    }
    
    func test() -> Void {
        print(nextGreaterElement([4, 1, 2], [1, 3, 4, 2]))
        print(nextGreaterElement([2, 4], [1, 2, 3, 4]))
        print(nextGreaterElement([1, 3, 5, 2, 4], [6, 5, 4, 3, 2, 1, 7]))
    }
}
