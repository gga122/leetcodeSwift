//
//  MergeTwoBinaryTrees.swift
//  leetcode
//
//  Created by Henry on 2019/4/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MergeTwoBinaryTreesSolution {

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
    
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {
            if t2 == nil {
                return nil
            } else {
                return t2
            }
        } else {
            if t2 == nil {
                return t1
            } else {
                t1!.val += t2!.val
                t1!.left = mergeTrees(t1!.left, t2!.left)
                t1!.right = mergeTrees(t1!.right, t2!.right)
                return t1
            }
        }
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(3)
        a0.left = a1
        let a2 = TreeNode.init(2)
        a0.right = a2
        let a3 = TreeNode.init(5)
        a1.left = a3
        
        let b0 = TreeNode.init(2)
        let b1 = TreeNode.init(1)
        b0.left = b1
        let b2 = TreeNode.init(3)
        b0.right = b2
        let b4 = TreeNode.init(4)
        b1.right = b4
        let b6 = TreeNode.init(7)
        b2.right = b6
        
        print(mergeTrees(a0, b0)!)
    }
}
