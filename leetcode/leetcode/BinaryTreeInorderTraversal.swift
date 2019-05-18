//
//  BinaryTreeInorderTraversal.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryTreeInorderTraversalSolution {

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

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var ret = [Int]()
        let res1 = inorderTraversal(root!.left)
        ret += res1
        ret.append(root!.val)
        let res2 = inorderTraversal(root!.right)
        ret += res2
        
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a2 = TreeNode.init(2)
        a0.right = a2
        let a5 = TreeNode.init(3)
        a2.left = a5
        print(inorderTraversal(a0))
    }
}
