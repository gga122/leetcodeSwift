//
//  ConstructBinarySearchTreeFromPreorderTraversal.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConstructBinarySearchTreeFromPreorderTraversalSolution {

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
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        if preorder.count == 0 {
            return nil
        }
        if preorder.count == 1 {
            return TreeNode.init(preorder[0])
        }
        
        var root: TreeNode? = nil
        for num in preorder {
            root = addNode(root, num)
        }
        
        return root
    }
    
    func addNode(_ root: TreeNode?, _ v: Int) -> TreeNode? {
        if root == nil {
            return TreeNode.init(v)
        }
        
        if v < root!.val {
            root!.left = addNode(root!.left, v)
        } else {
            root!.right = addNode(root!.right, v)
        }
        
        return root
    }
    
    func test() -> Void {
        print(bstFromPreorder([8,5,1,7,10,12]))
    }
}
