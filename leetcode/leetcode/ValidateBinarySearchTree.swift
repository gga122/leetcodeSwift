//
//  ValidateBinarySearchTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ValidateBinarySearchTreeSolution {

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
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        var stack = [TreeNode]()
        var current = root
        var previous: TreeNode? = nil
        while !stack.isEmpty || current != nil {
            while current != nil {
                stack.append(current!)
                current = current?.left
            }
            
            let node = stack.removeLast()
            if previous != nil {
                if node.val <= previous!.val {
                    return false
                }
            }
            current = node.right
            
            previous = node
        }
        
        return true
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(2)
        let a1 = TreeNode.init(1)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        print(isValidBST(a0))
    }
}
