//
//  SumRootToLeafNumbers.swift
//  leetcode
//
//  Created by Henry on 2019/5/31.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SumRootToLeafNumbersSolution {

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
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let v = preorder(root, 0)
        return v
    }
    
    func preorder(_ root: TreeNode?, _ tmp: Int) -> Int {
        if root == nil {
            return 0
        }
        
        let cur = tmp * 10 + root!.val
        if root?.left == nil && root?.right == nil {
            return cur
        }
        
        var res = 0;
        if root?.left != nil {
            res += preorder(root!.left, cur)
        }
        if root?.right != nil {
            res += preorder(root!.right, cur)
        }

        return res
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        
        print(sumNumbers(a0))
    }
}
