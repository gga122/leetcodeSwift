//
//  BinaryTreePruning.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryTreePruningSolution {

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

    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        root!.left = pruneTree(root!.left)
        root!.right = pruneTree(root!.right)
        
        if isLeaf(root) && root!.val == 0 {
            return nil
        }
        
        return root
    }
    
    func isLeaf(_ node: TreeNode?) -> Bool {
        if node == nil {
            return false
        }
        
        return node!.left == nil && node!.right == nil
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a2 = TreeNode.init(0)
        a0.right = a2
        let a5 = TreeNode.init(0)
        a2.left = a5
        let a6 = TreeNode.init(1)
        a2.right = a6
        print(pruneTree(a0)!)
        
        let b0 = TreeNode.init(1)
        let b1 = TreeNode.init(0)
        b0.left = b1
        let b2 = TreeNode.init(1)
        b0.right = b2
        let b3 = TreeNode.init(0)
        b1.left = b3
        let b4 = TreeNode.init(0)
        b1.right = b4
        let b5 = TreeNode.init(0)
        b2.left = b5
        let b6 = TreeNode.init(1)
        b2.right = b6
        print(pruneTree(b0)!)
    }
}
