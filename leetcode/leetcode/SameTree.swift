//
//  SameTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation


class SameTreeSolution {
    
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
 
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p != nil && q != nil && p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else {
            return false
        }
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        
        let b0 = TreeNode.init(1)
        let b1 = TreeNode.init(2)
        b0.left = b1
        let b2 = TreeNode.init(3)
        b0.right = b2
        print(isSameTree(a0, b0))
    }
}
