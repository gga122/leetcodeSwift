//
//  main.swift
//  bytedance
//
//  Created by Henry on 2019/5/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

/*
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = (end - start) / 2 + start
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        return -1
    }
    
    func test() -> Void {
        print(search([-1, 0, 3, 5, 9, 12], 9))
    }
}
*/

/*
class Solution {
    
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        
        let mid = nums.count / 2
        let root = TreeNode.init(nums[mid])
        let leftPart = Array(nums[0..<mid])
        root.left = sortedArrayToBST(leftPart)
        let rightPart = Array(nums[mid+1..<nums.count])
        root.right = sortedArrayToBST(rightPart)
        
        return root
    }
    
    func test() -> Void {
        print(sortedArrayToBST([-10,-3,0,5,9])!)
    }
}
 */

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }
        
        var ret = [[Int]]()
        backTracking(&ret, nums, [], 0)
        ret.append([])
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ nums: [Int], _ tmp: [Int], _ length: Int) -> Void {
        if length >= nums.count {
            return
        } else {
            for i in length..<nums.count {
                var tmp = tmp
                tmp.append(nums[i])
                result.append(tmp)
                backTracking(&result, nums, tmp, i + 1)
            }
        }
    }
    
    func test() -> Void {
        print(subsets([1,2,3]))
    }
}

Solution.init().test()
