//
//  KthSmallestElementInABST.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class KthSmallestElementInABSTSolution {
    
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

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return NSNotFound
        }
        
        let leftCount = nodeCount(root!.left)
        if leftCount == k - 1 {
            return root!.val
        }
        if leftCount > k - 1 {
            return kthSmallest(root!.left, k)
        }
        return kthSmallest(root!.right, k - leftCount - 1)
    }
    
    func nodeCount(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return 1 + nodeCount(root!.left) + nodeCount(root!.right)
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(3)
        let a1 = TreeNode.init(1)
        a0.left = a1
        let a2 = TreeNode.init(4)
        a0.right = a2
        let a4 = TreeNode.init(2)
        a1.right = a4
        print(kthSmallest(a0, 1))
    }
}
