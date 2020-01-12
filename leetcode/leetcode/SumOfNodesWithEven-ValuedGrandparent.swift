//
//  Sum of NodesWithEven-ValuedGrandparent.swift
//  leetcode
//
//  Created by Henry on 2020/1/12.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class NodesWithEven_ValuedGrandparentSolution {
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
    
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var result = 0
        var nodes = [root!]
        while nodes.count > 0 {
            let subnodes = getSubnodes(nodes)
            for n in nodes {
                if n.val % 2 == 0 {
                    result += getGrandsonsSum(n)
                }
            }
            nodes = subnodes
        }
        
        return result
    }
    
    func getGrandsonsSum(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        
        var subnodes = getSubnodes([node!])
        if subnodes.count == 0 {
            return 0
        }
        subnodes = getSubnodes(subnodes)
        if subnodes.count == 0 {
            return 0
        }
        var result = 0
        for n in subnodes {
            result += n.val
        }
        
        return result
    }
    
    func getSubnodes(_ nodes: [TreeNode]?) -> [TreeNode] {
        if nodes == nil {
            return []
        }
        
        var subnodes = [TreeNode]()
        for node in nodes! {
            if let left = node.left {
                subnodes.append(left)
            }
            if let right = node.right {
                subnodes.append(right)
            }
        }
        
        return subnodes
    }
    
    func test() -> Void {
        let n0 = TreeNode.init(6)
        let n1 = TreeNode.init(7)
        n0.left = n1
        let n2 = TreeNode.init(8)
        n0.right = n2
        
        let n3 = TreeNode.init(2)
        n1.left = n3
        let n4 = TreeNode.init(7)
        n1.right = n4
        
        let n5 = TreeNode.init(1)
        n2.left = n5
        let n6 = TreeNode.init(3)
        n2.right = n6
        
        let n7 = TreeNode.init(9)
        n3.left = n7
        let n9 = TreeNode.init(1)
        n4.left = n9
        let n10 = TreeNode.init(4)
        n4.right = n10
        
        let n14 = TreeNode.init(5)
        n6.right = n14
        
        print(sumEvenGrandparent(n0))
    }
}
