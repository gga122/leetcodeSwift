//
//  SymmetricTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SymmetricTreeSolution {
    
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
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return isMirror(root?.left, root?.right)
    }
    
    func isMirror(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p != nil && q != nil {
            return p!.val == q!.val && isMirror(p?.left, q?.right) && isMirror(p?.right, q?.left)
        }
        
        return false
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(2)
        a0.right = a2
        let a3 = TreeNode.init(3)
        a1.left = a3
        let a4 = TreeNode.init(4)
        a1.right = a4
        let a5 = TreeNode.init(4)
        a2.left = a5
        let a6 = TreeNode.init(3)
        a2.right = a6
        print(isSymmetric(a0))
    }
}
