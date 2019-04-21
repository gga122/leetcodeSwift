//
//  AverageOfLevelInBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AverageOfLevelInBinaryTreeSolution {
    
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
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
    
        var averages = [Double]()
        averages.append(Double(root.val))
        var nodes = [TreeNode]()
        
        if let l = root.left {
            nodes.append(l)
        }
        if let r = root.right {
            nodes.append(r)
        }

        while nodes.count > 0 {
            let result = average(nodes)
            if result.end {
                break
            }
            
            averages.append(result.average)
            nodes = result.nextLevelNodes
        }
        
        return averages
    }
    
    func average(_ nodes: [TreeNode]) -> (average: Double, nextLevelNodes: [TreeNode], end: Bool) {
        if nodes.count == 0 {
            return (0, [], true)
        }
        
        var nextNodes = [TreeNode]()
        var average: Double = 0
        for node in nodes {
            average += Double(node.val)
            if let l = node.left {
                nextNodes.append(l)
            }
            if let r = node.right {
                nextNodes.append(r)
            }
        }
        
        average /= Double(nodes.count)
        return (average, nextNodes, false)
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
        
        print(averageOfLevels(n0))
    }
}
