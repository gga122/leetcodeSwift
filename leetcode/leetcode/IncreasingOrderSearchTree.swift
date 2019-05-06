//
//  IncreasingOrderSearchTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class IncreasingOrderSearchTreeSolution {
    
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
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        var stack = [TreeNode]()
        var current = root
        let dummy = TreeNode.init(-1)
        var p: TreeNode? = dummy
        while !stack.isEmpty || current != nil {
            while current != nil {
                stack.append(current!)
                current = current?.left
            }
            
            let node = stack.popLast()!
            node.left = nil
            current = node.right
            p?.right = node
            p = p?.right
        }
        
        return dummy.right
        /*
        let nodes = helper(root)
        
        var i = 0
        while i < nodes.count - 1 {
            nodes[i].left = nil
            nodes[i].right = nodes[i + 1]
            i += 1
        }
        
        return nodes.first
         */
    }
    
    func helper(_ root: TreeNode?) -> [TreeNode] {
        if root == nil {
            return []
        }
        
        let left = helper(root?.left)
        let right = helper(root?.right)
        let nodes: [TreeNode] = left + [root!] + right
        return nodes
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(5)
        let a1 = TreeNode.init(3)
        a0.left = a1
        let a2 = TreeNode.init(6)
        a0.right = a2
        let a3 = TreeNode.init(2)
        a1.left = a3
        let a4 = TreeNode.init(4)
        a1.right = a4
        let a6 = TreeNode.init(8)
        a2.right = a6
        let a7 = TreeNode.init(1)
        a3.left = a7
        let a11 = TreeNode.init(7)
        a6.left = a11
        let a12 = TreeNode.init(9)
        a6.right = a12
        
        print(increasingBST(a0)!)
        
        let b0 = TreeNode.init(265)
        let b2 = TreeNode.init(519)
        b0.right = b2
        let b5 = TreeNode.init(615)
        b2.left = b5
        print(increasingBST(b0)!)
    }
}
