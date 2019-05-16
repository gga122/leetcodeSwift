//
//  MaximumBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/17.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximumBinaryTreeSolution {
    
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
    
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        if nums.count == 1 {
            let node = TreeNode.init(nums[0])
            return node
        }
        
        var maxIndex = 0
        for i in 1..<nums.count {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        
        let root = TreeNode.init(nums[maxIndex])
        let leftPart = nums[0..<maxIndex]
        let left = constructMaximumBinaryTree(Array(leftPart))
        root.left = left
        if maxIndex + 1 < nums.count {
            let rightPart = nums[(maxIndex + 1)..<nums.count]
            let right = constructMaximumBinaryTree(Array(rightPart))
            root.right = right
        }
        
        return root
    }
    
    func test() -> Void {
        print(constructMaximumBinaryTree([3,2,1,6,0,5])!)
    }
}
