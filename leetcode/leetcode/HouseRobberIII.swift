//
//  HouseRobberIII.swift
//  leetcode
//
//  Created by Henry on 2019/5/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class HouseRobberIIISolution {
    
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
    
    func rob(_ root: TreeNode?) -> Int {
        let res = helper(root)
        return max(res.maxWithRoot, res.maxWithoutRoot)
    }
    
    func helper(_ root: TreeNode?) -> (maxWithRoot: Int, maxWithoutRoot: Int) {
        var res = (0, 0)
        if root == nil {
            return res
        }
        
        let left = helper(root!.left)
        let right = helper(root!.right)
        
        res.0 = max(left.maxWithoutRoot, left.maxWithRoot)+max(right.maxWithRoot, right.maxWithoutRoot)
        res.1 = left.maxWithRoot+right.maxWithRoot+root!.val
        
        return res
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(3)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        let a4 = TreeNode.init(3)
        a1.right = a4
        let a6 = TreeNode.init(1)
        a2.right = a6
        print(rob(a0))
        
        let b0 = TreeNode.init(3)
        let b1 = TreeNode.init(4)
        b0.left = b1
        let b2 = TreeNode.init(5)
        b0.right = b2
        let b3 = TreeNode.init(1)
        b1.left = b3
        let b4 = TreeNode.init(3)
        b1.right = b4
        let b6 = TreeNode.init(1)
        b2.right = b6
        print(rob(b0))
    }
}
