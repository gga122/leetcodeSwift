//
//  BalancedBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BalancedBinaryTreeSolution {
    
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
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        return isBST(root).isbalance
    }
    
    func isBST(_ node: TreeNode?) -> (height: Int, isbalance: Bool) {
        if node == nil {
            return (0, true)
        }
        
        let lb = isBST(node?.left)
        let rb = isBST(node?.right)
        if !lb.isbalance || !rb.isbalance {
            return (lb.height, false)
        }
        
        if abs(lb.height - rb.height) > 1 {
            return (lb.height, false)
        }
        
        return (max(lb.height, rb.height) + 1, true)
    }
    
    func test() -> Void {
        let m0 = TreeNode.init(3)
        let m1 = TreeNode.init(9)
        m0.left = m1
        let m2 = TreeNode.init(20)
        m0.right = m2
        let m3 = TreeNode.init(15)
        m2.left = m3
        let m4 = TreeNode.init(7)
        m2.right = m4
        print(isBalanced(m0))
        
        let n0 = TreeNode.init(1)
        let n1 = TreeNode.init(2)
        n0.left = n1
        let n2 = TreeNode.init(2)
        n1.right = n2
        let n3 = TreeNode.init(3)
        n1.left = n3
        let n4 = TreeNode.init(3)
        n1.right = n4
        let n5 = TreeNode.init(4)
        n3.left = n5
        let n6 = TreeNode.init(4)
        n3.right = n6
        print(isBalanced(n0))
    }
}
