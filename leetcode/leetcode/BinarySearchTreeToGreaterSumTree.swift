//
//  BinarySearchTreeToGreaterSumTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/16.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinarySearchTreeToGreaterSumTreeSolution {

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
    
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var stack = [TreeNode]()
        var current = root
        var previous: TreeNode? = nil
        while !stack.isEmpty || current != nil {
            while current != nil {
                stack.append(current!)
                current = current!.right
            }
            
            let node = stack.removeLast()
            if previous != nil {
                node.val = node.val + previous!.val
                current = node.left
            }
            previous = node
        }
        
        return root
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(4)
        let a1 = TreeNode.init(1)
        a0.left = a1
        let a2 = TreeNode.init(6)
        a0.right = a2
        let a3 = TreeNode.init(0)
        a1.left = a3
        let a4 = TreeNode.init(2)
        a1.right = a4
        let a5 = TreeNode.init(5)
        a2.left = a5
        let a6 = TreeNode.init(7)
        a2.right = a6
        let a10 = TreeNode.init(3)
        a4.right = a10
        let a14 = TreeNode.init(8)
        a6.right = a14
        print(bstToGst(a0)!)
    }
}
