//
//  BinaryTreeLevelOrderTraversal.swift
//  leetcode
//
//  Created by Henry on 2019/4/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryTreeLevelOrderTraversalSolution {

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
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var values = [[Int]]()
        var nodes = [root]
        while !nodes.isEmpty {
            let r = getNodes(nodes)
            values.append(r.v)
            
            nodes = r.nodes
        }
        
        values = values.reversed()
        return values
    }
    
    func getNodes(_ nodes: [TreeNode]) -> (v: [Int], nodes: [TreeNode]) {
        if nodes.isEmpty {
            return ([], [])
        }
        
        var values = [Int]()
        var nextNodes = [TreeNode]()
        for n in nodes {
            values.append(n.val)
            if let l = n.left {
                nextNodes.append(l)
            }
            if let r = n.right {
                nextNodes.append(r)
            }
        }
        
        return (values, nextNodes)
    }
    
    func test() -> Void {
        let n0 = TreeNode.init(3)
        let n1 = TreeNode.init(9)
        n0.left = n1
        let n2 = TreeNode.init(20)
        n0.right = n2
        let n3 = TreeNode.init(15)
        n2.left = n3
        let n4 = TreeNode.init(7)
        n2.right = n4
        
        print(levelOrderBottom(n0))
    }
}
