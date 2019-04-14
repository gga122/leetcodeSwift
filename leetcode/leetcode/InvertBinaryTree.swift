//
//  InvertBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class InvertBinaryTreeSolution {
 
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
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        if root?.left == nil && root?.right == nil {
            return root;
        }
        
        let tmp = invertTree(root!.left)
        root?.left = invertTree(root!.right)
        root?.right = tmp
        return root
    }
    
    func test() -> Void {
        let n0 = TreeNode.init(4)
        let n1 = TreeNode.init(2)
        n0.left = n1
        let n2 = TreeNode.init(7)
        n0.right = n2
        let n3 = TreeNode.init(1)
        n1.left = n3
        let n4 = TreeNode.init(3)
        n1.right = n4
        let n5 = TreeNode.init(6)
        n2.left = n5
        let n6 = TreeNode.init(9)
        n2.right = n6
        
        print(invertTree(n0)!)
    }
}
