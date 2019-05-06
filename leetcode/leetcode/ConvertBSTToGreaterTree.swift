//
//  ConvertBSTToGreaterTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConvertBSTToGreaterTreeSolution {
    
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
    
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var stack = [TreeNode]()
        var current = root
        var lastNode: TreeNode? = nil
        while !stack.isEmpty || current != nil {
            /* Push right into stack */
            while current != nil {
                stack.append(current!)
                current = current?.right
            }
            /* Pop and reverse add */
            let node = stack.popLast()!
            node.val += lastNode?.val ?? 0
            lastNode = node
            current = node.left
        }
        
        return root
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(5)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(13)
        a0.right = a2
        
        print(convertBST(a0)!)
    }
}
