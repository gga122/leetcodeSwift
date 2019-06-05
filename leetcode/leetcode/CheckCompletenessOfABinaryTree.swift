//
//  CheckCompletenessOfABinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/6/5.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CheckCompletenessOfABinaryTreeSolution {

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
    
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        if root == nil {
            return false
        }
        
        var nodes = [root!]
        var indexes = [0]
        var expectNodeCount = 1
        while !nodes.isEmpty {
            let subNodes = helper(nodes)
            let subIndexes = subNodes.1
            if !subIndexes.isEmpty {
                if subIndexes[0] != 0 {
                    return false
                }
                for i in 1..<subIndexes.count {
                    if subIndexes[i] - subIndexes[i-1] > 1 {
                        return false
                    }
                }
            }
            
            if !subIndexes.isEmpty && indexes.count != expectNodeCount {
                return false
            }
            
            nodes = subNodes.0
            indexes = subNodes.1
            expectNodeCount *= 2
        }
        
        return true
    }
    
    func helper(_ nodes: [TreeNode]) -> ([TreeNode], [Int]) {
        if nodes.isEmpty {
            return ([], [])
        }
        
        var indexes = [Int]()
        var subNodes = [TreeNode]()
        for i in 0..<nodes.count {
            if let left = nodes[i].left {
                subNodes.append(left)
                indexes.append(i*2)
            }
            if let right = nodes[i].right {
                subNodes.append(right)
                indexes.append(i*2+1)
            }
        }
        return (subNodes, indexes)
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        let a3 = TreeNode.init(4)
        a1.left = a3
        let a4 = TreeNode.init(5)
        a1.right = a4
        let a5 = TreeNode.init(6)
        a2.left = a5
        print(isCompleteTree(a0))
    }
}
