//
//  DiameterOfBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DiameterOfBinaryTreeSolution {

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
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftHigh = high(root!.left)
        let rightHigh = high(root!.right)
        let Max = leftHigh + rightHigh
        
        let leftDiameter = diameterOfBinaryTree(root!.left)
        let rightDiameter = diameterOfBinaryTree(root!.right)
      
        return max(max(Max, leftDiameter), rightDiameter)
    }
    
    func high(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return 1 + max(high(root!.left), high(root!.right))
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        let a3 = TreeNode.init(4)
        a1.left = a3
        let a4 = TreeNode.init(5)
        a1.right = a4
        print(diameterOfBinaryTree(a0))
    }
}
