//
//  FindBottomLeftTreeValue.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindBottomLeftTreeValueSolution {

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

    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        if root == nil {
            return NSNotFound
        }
        
        var nodes = [root!]
        var ret = root!.val
        while nodes.count > 0 {
            let subNodes = nextLevelNodes(nodes)
            if subNodes.count > 0 {
                ret = subNodes[0].val
            }
            nodes = subNodes
        }
        
        return ret
    }
    
    func nextLevelNodes(_ nodes: [TreeNode]) -> [TreeNode] {
        if nodes.count == 0 {
            return []
        }
        
        var ret = [TreeNode]()
        for node in nodes {
            if node.left != nil {
                ret.append(node.left!)
            }
            if node.right != nil {
                ret.append(node.right!)
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(2)
        let a1 = TreeNode.init(1)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        print(findBottomLeftValue(a0))
        
        let b0 = TreeNode.init(1)
        let b1 = TreeNode.init(2)
        b0.left = b1
        let b2 = TreeNode.init(3)
        b0.right = b2
        let b3 = TreeNode.init(4)
        b1.left = b3
        let b5 = TreeNode.init(5)
        b2.left = b5
        let b6 = TreeNode.init(6)
        b2.right = b6
        let b7 = TreeNode.init(7)
        b5.left = b7
        print(findBottomLeftValue(b0))
    }
}
