//
//  AllElementsInTwoBinarySearchTrees.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AllElementsInTwoBinarySearchTreesSolution {

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
    
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var allNodes = [TreeNode]()
        
        var nodes1 = root1 != nil ? [root1!] : [TreeNode]()
        if nodes1.count > 0 {
            allNodes.append(contentsOf: nodes1)
        }
        while nodes1.count > 0 {
            nodes1 = getSubNodes(nodes1)
            allNodes.append(contentsOf: nodes1)
        }
        
        var nodes2 = root2 != nil ? [root2!] : [TreeNode]()
        if nodes2.count > 0 {
            allNodes.append(contentsOf: nodes2)
        }
        while nodes2.count > 0 {
            nodes2 = getSubNodes(nodes2)
            allNodes.append(contentsOf: nodes2)
        }
        
        let values = allNodes.map { (node) -> Int in
            return node.val
        }
        
        let sorted = values.sorted()
        return sorted
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
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(8)
        a0.right = a1
        let b0 = TreeNode.init(8)
        let b1 = TreeNode.init(1)
        b0.left = b1
        print(getAllElements(a0, b0))
    }
}
