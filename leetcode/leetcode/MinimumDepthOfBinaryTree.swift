//
//  MinimumDepthOfBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/25.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinimumDepthOfBinaryTreeSolution {

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

    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftHeight = minDepth(root!.left)
        let rightHeight = minDepth(root!.right)
        return (leftHeight > 0 && rightHeight > 0) ? min(leftHeight, rightHeight) + 1 : 1 + leftHeight + rightHeight
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
        print(minDepth(a0))
    }
}
