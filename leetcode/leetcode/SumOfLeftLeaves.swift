//
//  SumOfLeftLeaves.swift
//  leetcode
//
//  Created by Henry on 2019/5/9.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SumOfLeftLeavesSolution {
    
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
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root!.left == nil && root!.right == nil {
            return 0
        }
        
        return helper(root!.left, true) + helper(root!.right, false)
    }
    
    func helper(_ root: TreeNode?, _ isLeft: Bool) -> Int {
        if root == nil {
            return 0
        }
        if root!.left == nil && root!.right == nil && isLeft {
            return root!.val
        }
        
        return helper(root!.left, true) + helper(root!.right, false)
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(3)
        let a1 = TreeNode.init(9)
        a0.left = a1
        let a2 = TreeNode.init(20)
        a0.right = a2
        let a5 = TreeNode.init(15)
        a2.left = a5
        let a6 = TreeNode.init(7)
        a2.right = a6
        print(sumOfLeftLeaves(a0))
    }
}
