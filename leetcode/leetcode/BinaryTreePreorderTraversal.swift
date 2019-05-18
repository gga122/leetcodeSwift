//
//  BinaryTreePreorderTraversal.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryTreePreorderTraversalSolution {

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
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var ret = [Int]()
        ret.append(root!.val)
        ret += preorderTraversal(root!.left)
        ret += preorderTraversal(root!.right)
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a2 = TreeNode.init(2)
        a0.right = a2
        let a5 = TreeNode.init(3)
        a2.left = a5
        print(preorderTraversal(a0))
    }
}
