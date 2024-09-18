//
//  88.swift
//  LeetCode
//
//  Created by henry on 2024/9/18.
//

import Foundation

class Solution_88 {
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard n > 0 else {
            return
        }
        guard m > 0 else {
            nums1 = nums2
            return
        }
        
        var p1 = m - 1
        var p2 = n - 1
        var tail = m + n - 1
        var cur: Int
        
        // 循环到两个部分都走完
        while p1 >= 0 || p2 >= 0 {
            if p1 == -1 { // P1已经走完
                cur = nums2[p2]
                p2 -= 1
            } else if p2 == -1 { // P2已经走完
                cur = nums1[p1]
                p1 -= 1
            } else if nums1[p1] > nums2[p2] { // 如果两个都没走完，取大的
                cur = nums1[p1]
                p1 -= 1
            } else {
                cur = nums2[p2]
                p2 -= 1
            }
            
            // 移动尾巴
            nums1[tail] = cur
            tail -= 1
        }
    }
    
    func test() {
        test1()
        test2()
        test3()
        test4()
        test5()
        test6()
        test7()
    }
    
    func test1() {
        var nums1 = [1,2,3,0,0,0]
        merge(&nums1, 3, [2,5,6], 3)
        print(nums1)
    }
    
    func test2() {
        var nums1 = [1]
        merge(&nums1, 1, [], 0)
        print(nums1)
    }
    
    func test3() {
        var nums1 = [0]
        merge(&nums1, 0, [1], 1)
        print(nums1)
    }
    
    func test4() {
        var nums1 = [1,7,10,0,0,0]
        merge(&nums1, 3, [2,5,6], 3)
        print(nums1)
    }
    
    func test5() {
        var nums1 = [2,0]
        merge(&nums1, 1, [1], 1)
        print(nums1)
    }
    
    func test6() {
        var nums1 = [4,5,6,0,0,0]
        merge(&nums1, 3, [1,2,3], 3)
        print(nums1)
    }
    
    func test7() {
        var nums1 = [4,0,0,0,0,0]
        merge(&nums1, 1, [1,2,3,5,6], 5)
        print(nums1)
    }
}
