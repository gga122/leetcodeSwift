//
//  MaximumDepthOfBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximumDepthOfBinaryTreeSolution {
    
    class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    func test() -> Void {
        let n0 = TreeNode.init(3)
        let n1 = TreeNode.init(9)
        n0.left = n1
        let n2 = TreeNode.init(20)
        n0.right = n2
        let n3 = TreeNode.init(15)
        n2.left = n3
        let n4 = TreeNode.init(7)
        n2.right = n4
        
        print(maxDepth(n0))
        
        
    }
}
