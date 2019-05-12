//
//  SecondMinimumNodeInABinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SecondMinimumNodeInABinaryTreeSolution {

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
    
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        if root == nil {
            return -1
        }
        
        var nodes = [root!]
        var Min = (Int.max, Int.max) // MIN.0 > MIN.1
        var elements = Set<Int>.init()
        while !nodes.isEmpty {
            for node in nodes {
                if elements.contains(node.val) {
                    continue
                }
                elements.insert(node.val)
                
                if node.val < Min.1 {
                    Min.0 = Min.1
                    Min.1 = node.val
                } else if (node.val < Min.0) {
                    Min.0 = node.val
                }
            }
            
            nodes = getSubNodes(nodes)
        }
        
        if elements.count < 2 {
            return -1
        }
        return Min.0
    }
    
    func getSubNodes(_ nodes: [TreeNode]?) -> [TreeNode] {
        if nodes == nil {
            return []
        }
        
        var ret = [TreeNode]()
        for node in nodes! {
            if node.left != nil {
                ret.append(node.left!)
                ret.append(node.right!)
            }
        }
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(2)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(5)
        a0.right = a2
        let a5 = TreeNode.init(5)
        a2.left = a5
        let a6 = TreeNode.init(7)
        a2.right = a6
        print(findSecondMinimumValue(a0))
        
        let b0 = TreeNode.init(2)
        let b1 = TreeNode.init(2)
        b0.left = b1
        let b2 = TreeNode.init(2)
        b0.right = b2
        print(findSecondMinimumValue(b0))
        
        let c0 = TreeNode.init(2)
        let c1 = TreeNode.init(2)
        c0.left = c1
        let c2 = TreeNode.init(5)
        c0.right = c2
        let c5 = TreeNode.init(5)
        c2.left = c5
        let c6 = TreeNode.init(5)
        c2.right = c6
        print(findSecondMinimumValue(c0))
    }
}
