//
//  UnivaluedBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UnivaluedBinaryTreeSolution {

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
    
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if root!.left != nil && root!.val != root!.left!.val {
            return false
        }
        if root!.right != nil && root!.val != root!.right!.val {
            return false
        }
        
        if !isUnivalTree(root?.left) {
            return false
        }
        if !isUnivalTree(root?.right) {
            return false
        }
        
        return true
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(1)
        a0.left = a1
        let a2 = TreeNode.init(1)
        a0.right = a2
        let a3 = TreeNode.init(1)
        a1.left = a3
        let a4 = TreeNode.init(1)
        a1.right = a4
        let a6 = TreeNode.init(1)
        a2.right = a6
        
        print(isUnivalTree(a0))
    }
}
