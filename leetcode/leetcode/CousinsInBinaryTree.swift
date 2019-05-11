//
//  CousinsInBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CousinsInBinaryTreeSolution {
    
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
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        if root == nil {
            return false
        }
        
        var nodes = [root!]
        while !nodes.isEmpty {
            let subNodes = helper(nodes)
            
            var i = 0
            var xIndex = -1
            var yIndex = -1
            nodes.removeAll()
            while i < subNodes.count {
                if subNodes.isEmpty {
                    continue
                }
                let subNode = subNodes[i]
                for n in subNode {
                    if n.val == x {
                        xIndex = i
                    }
                    if n.val == y {
                        yIndex = i
                    }
                    nodes.append(n)
                }
                i += 1
            }
            
            if xIndex >= 0 {
                if yIndex >= 0 {
                    return xIndex != yIndex
                } else {
                    break
                }
            } else {
                if yIndex >= 0 {
                    break
                } else {
                    // Do nothing
                }
            }
        }
        
        return false
    }
    
    func helper(_ nodes: [TreeNode]) -> [[TreeNode]] {
        if nodes.isEmpty {
            return []
        }
    
        var ret = [[TreeNode]]()
        for node in nodes {
            var sub = [TreeNode]()
            if node.left != nil {
                sub.append(node.left!)
            }
            if node.right != nil {
                sub.append(node.right!)
            }
            ret.append(sub)
        }
        
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        let a3 = TreeNode.init(4)
        a1.left = a3
        print(isCousins(a0, 4, 3))
        
        let b0 = TreeNode.init(1)
        let b1 = TreeNode.init(2)
        b0.left = b1
        let b2 = TreeNode.init(3)
        b0.right = b2
        let b4 = TreeNode.init(4)
        b1.right = b4
        let b6 = TreeNode.init(5)
        b2.right = b6
        print(isCousins(b0, 5, 4))
        
        let c0 = TreeNode.init(1)
        let c1 = TreeNode.init(2)
        c0.left = c1
        let c2 = TreeNode.init(5)
        c0.right = c2
        let c3 = TreeNode.init(8)
        c1.left = c3
        let c4 = TreeNode.init(3)
        c1.right = c4
        let c6 = TreeNode.init(7)
        c2.right = c6
        let c7 = TreeNode.init(9)
        c3.left = c7
        let c10 = TreeNode.init(4)
        c4.right = c10
        let c15 = TreeNode.init(6)
        c10.left = c15
        print(isCousins(c0, 9, 4))
    }
}
