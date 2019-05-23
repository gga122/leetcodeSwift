//
//  BinaryTreeZigzagLevelOrderTraversal.swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryTreeZigzagLevelOrderTraversalSolution {

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
    
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var nodes = [root!]
        var reverse = false
        var ret = [[Int]]()
        while nodes.count > 0 {
            var vals = [Int]()
            if reverse {
                for n in nodes.reversed() {
                    vals.append(n.val)
                }
            } else {
                for n in nodes {
                    vals.append(n.val)
                }
            }
            ret.append(vals)
            nodes = subNodes(nodes)
            
            reverse.toggle()
        }
        
        return ret
    }
    
    func subNodes(_ nodes: [TreeNode]) -> [TreeNode] {
        if nodes.count == 0 {
            return []
        }
        
        var subNodes = [TreeNode]()
        for node in nodes {
            if let left = node.left {
                subNodes.append(left)
            }
            if let right = node.right {
                subNodes.append(right)
            }
        }
        return subNodes
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
        
        print(zigzagLevelOrder(a0))
    }
}
