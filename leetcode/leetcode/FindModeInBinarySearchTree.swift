//
//  FindModeInBinarySearchTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindModeInBinarySearchTreeSolution {
    
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
    
    func findMode(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var set = Set<Int>.init()
        var maxCount = 0
        var count = 0
        var previous = Int.min
        var stack = [TreeNode]()
        var current = root
        /* Inorder traverse */
        while !stack.isEmpty || current != nil {
            /* traverse to the left leaf */
            if current != nil {
                stack.append(current!)
                current = current!.left
            } else {
                /* pop */
                let node = stack.removeLast()
                if node.val == previous {
                    count += 1
                } else {
                    count = 1
                }
                
                if count == maxCount { /* same mode */
                    set.insert(node.val)
                } else if count > maxCount { /* larger mode */
                    set.removeAll()
                    set.insert(node.val)
                    maxCount = count
                }
                
                previous = node.val
                /* Move node to right leaf */
                current = node.right
            }
        }
        
        var ret = [Int]()
        for v in set {
            ret.append(v)
        }
        
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a2 = TreeNode.init(2)
        a0.right = a2
        let a5 = TreeNode.init(2)
        a2.left = a5
        print(findMode(a0))
        
        let b0 = TreeNode.init(1)
        let b1 = TreeNode.init(1)
        b0.left = b1
        let b2 = TreeNode.init(2)
        b0.right = b2
        print(findMode(b0))
    }
}
