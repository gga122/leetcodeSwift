//
//  BinaryTreeRightSideView.swift
//  leetcode
//
//  Created by Henry on 2019/5/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryTreeRightSideViewSolution {

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
 
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var values = [Int]()
        var nodes = [root]
        while !nodes.isEmpty {
            values.append(nodes.last!.val)
            nodes = getNodes(nodes)
        }
        
        return values
    }
    
    func getNodes(_ nodes: [TreeNode]) -> [TreeNode] {
        if nodes.isEmpty {
            return []
        }
        
        var nextNodes = [TreeNode]()
        for n in nodes {
            if let l = n.left {
                nextNodes.append(l)
            }
            if let r = n.right {
                nextNodes.append(r)
            }
        }
        
        return nextNodes
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        let a4 = TreeNode.init(5)
        a1.right = a4
        let a6 = TreeNode.init(4)
        a2.right = a6
        print(rightSideView(a0))
    }
}
