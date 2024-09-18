//
//  27.swift
//  LeetCode
//
//  Created by henry on 2024/9/19.
//

import Foundation

class Solution_27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var beginIndex = 0
        var endIndex = nums.count - 1
        var count = 0
        
        while beginIndex <= endIndex {
            /* 
             从后往前遍历
             1. 发现一致的直接跳过, 依然放在原位
             2. 发现不一致的，与头部元素交换, 并将头部游标右移动
             */
            if nums[endIndex] != val {
                count += 1
                nums.swapAt(beginIndex, endIndex)
                beginIndex += 1
            } else {
                endIndex -= 1
            }
        }
        
        return count
    }
    
    func test() {
        test1()
        test2()
        test3()
    }
    
    func test1() {
        var nums = [3,2,2,3]
        let k = removeElement(&nums, 3)
        print("\(k) => \(nums)")
    }
    
    func test2() {
        var nums = [0,1,2,2,3,0,4,2]
        let k = removeElement(&nums, 2)
        print("\(k) => \(nums)")
    }
    
    func test3() {
        var nums = [2]
        let k = removeElement(&nums, 3)
        print("\(k) => \(nums)")
    }
}
