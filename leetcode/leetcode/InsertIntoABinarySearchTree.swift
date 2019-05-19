//
//  InsertIntoABinarySearchTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class InsertIntoABinarySearchTreeSolution {
    
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
    
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode.init(val)
        }
        
        if val < root!.val {
            root!.left = insertIntoBST(root!.left, val)
        } else if val > root!.val {
            root!.right = insertIntoBST(root!.right, val)
        }
        return root
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(4)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(7)
        a0.right = a2
        let a3 = TreeNode.init(1)
        a1.left = a3
        let a4 = TreeNode.init(3)
        a1.right = a4
        print(insertIntoBST(a0, 5)!)
    }
}
