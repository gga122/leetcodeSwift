//
//  MaximumWidthOfBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/6/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximumWidthOfBinaryTreeSolution {

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
    
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var maxLength = 1
        var nodes = [(root!, 0)]
        while !nodes.isEmpty {
            var subNodes = [(TreeNode, Int)]()
            for i in 0..<nodes.count {
                let node = nodes[i]
                if let left = node.0.left {
                    subNodes.append((left, (2 * node.1) % Int.max)) // mod Int.max for avoiding overflow
                }
                if let right = node.0.right {
                    subNodes.append((right, (2 * node.1 + 1) % Int.max))
                }
            }

            if subNodes.count > 1 {
                let length = subNodes.last!.1 - subNodes.first!.1 + 1
                maxLength = max(maxLength, length)
            }
            
            nodes = subNodes
        }
        
        return maxLength
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(3)
        a0.left = a1
        let a2 = TreeNode.init(2)
        a0.right = a2
        let a3 = TreeNode.init(5)
        a1.left = a3
        let a4 = TreeNode.init(3)
        a1.right = a4
        let a6 = TreeNode.init(9)
        a2.right = a6
        print(widthOfBinaryTree(a0))
        
        let b0 = TreeNode.init(1)
        let b1 = TreeNode.init(1)
        b0.left = b1
        let b2 = TreeNode.init(1)
        b0.right = b2
        let b3 = TreeNode.init(1)
        b1.left = b3
        let b6 = TreeNode.init(1)
        b2.right = b6
        let b7 = TreeNode.init(1)
        b3.left = b7
        let b16 = TreeNode.init(1)
        b6.right = b16
        print(widthOfBinaryTree(b0))
        
        var start = TreeNode.init(1)
        let c0 = start
        for _ in 0...1000 {
            start.right = TreeNode.init(1)
            start = c0.right!
        }
        start.left = TreeNode.init(1)
        start.right = TreeNode.init(1)
        print(widthOfBinaryTree(c0))
    }
}
