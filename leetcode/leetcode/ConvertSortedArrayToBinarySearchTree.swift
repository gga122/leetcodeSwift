//
//  ConvertSortedArrayToBinarySearchTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConvertSortedArrayToBinarySearchTreeSolution {
    
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
            return nil;
        }
        if nums.count == 1 {
            let root = TreeNode.init(nums.first!)
            return root
        }
        
        let root = buildBST(0, nums.count - 1, nums)
        return root;
    }
    
    func buildBST(_ left: Int, _ right: Int, _ nums: [Int]) -> TreeNode? {
        if left > right {
            return nil
        }
        
        let m = (right + left) / 2
        let n = TreeNode.init(nums[m])
        n.left = buildBST(left, m - 1, nums)
        n.right = buildBST(m + 1, right, nums)
        return n
    }
    
    func test() -> Void {
        print(sortedArrayToBST([-10, -3, 0, 5, 9]) as Any)
    }
}
