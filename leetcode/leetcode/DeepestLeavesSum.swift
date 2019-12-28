//
//  DeepestLeavesSum.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DeepestLeavesSumSolution {

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
    
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var nodes = [root!]
        var sum = nodes.reduce(0) { (last, node) -> Int in
            return last + node.val
        }
        while nodes.count != 0 {
            nodes = getSubNodes(nodes)
            if nodes.count > 0 {
                sum = nodes.reduce(0, { (last, node) -> Int in
                    return last + node.val
                })
            }
        }
        
        return sum
    }
    
    func getSubNodes(_ nodes: [TreeNode]) -> [TreeNode] {
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
        var nodes = [TreeNode]()
        for i in 1...8 {
            let node = TreeNode.init(i)
            nodes.append(node)
        }
        nodes[0].left = nodes[1]
        nodes[0].right = nodes[2]
        nodes[1].left = nodes[3]
        nodes[1].right = nodes[4]
        nodes[2].right = nodes[5]
        nodes[3].left = nodes[6]
        nodes[5].right = nodes[7]
        
        print(deepestLeavesSum(nodes[0]))
    }
}
