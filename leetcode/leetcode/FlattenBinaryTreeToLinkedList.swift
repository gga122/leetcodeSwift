//
//  FlattenBinaryTreeToLinkedList.swift
//  leetcode
//
//  Created by Henry on 2019/5/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FlattenBinaryTreeToLinkedListSolution {

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
    
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        /* preorder */
        flatten(root!.left)
        flatten(root!.right)
        
        var root = root
        /* backup the origin right node */
        let tmp = root!.right
        root!.right = root!.left
        root!.left = nil
        while root!.right != nil {
            root = root!.right
        }
        root!.right = tmp
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(5)
        a0.right = a2
        let a3 = TreeNode.init(3)
        a1.left = a3
        let a4 = TreeNode.init(4)
        a1.right = a4
        let a6 = TreeNode.init(6)
        a2.right = a6
        print(flatten(a0))
    }
}
