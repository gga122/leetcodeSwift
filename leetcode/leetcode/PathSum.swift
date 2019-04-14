//
//  PathSum.swift
//  leetcode
//
//  Created by Henry on 2019/4/14.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

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

class PathSumSolution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }
        
        let node = root!
        if node.left == nil && node.right == nil {
            return node.val == sum
        }
        let subsum = sum - node.val
        if hasPathSum(node.left, subsum) {
            return true
        }
        
        return hasPathSum(node.right, subsum)
    }
    
    func test() -> Void {
        
        /*
                5
               / \
              4   8
             /   / \
            11  13  4
           /  \      \
          7    2      1
         */
        let n0 = TreeNode.init(5)
        let n1 = TreeNode.init(4)
        n0.left = n1
        let n2 = TreeNode.init(8)
        n0.right = n2
        
        let n3 = TreeNode.init(11)
        n1.left = n3
        let n4 = TreeNode.init(13)
        n2.left = n4
        let n5 = TreeNode.init(4)
        n2.right = n5
        
        let n6 = TreeNode.init(7)
        n3.left = n6
        let n7 = TreeNode.init(2)
        n3.right = n7
        let n8 = TreeNode.init(1)
        n5.right = n8
        
        print(hasPathSum(n0, 22))
        print(hasPathSum(nil, 0))
        
        let t0 = TreeNode.init(1)
        let t1 = TreeNode.init(2)
        t0.left = t1
        print(hasPathSum(t0, 1))
    }
}
