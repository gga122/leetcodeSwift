//
//  TwoSumIV-InputIsABST.swift
//  leetcode
//
//  Created by Henry on 2019/5/10.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TwoSumIV_InputIsABSTSolution {
    
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
 
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        if root == nil {
            return false
        }
        
        var nodes = [TreeNode]()
        inorder(root, &nodes)
        var start = 0
        var end = nodes.count - 1
        while start < end {
            let sum = nodes[start].val + nodes[end].val
            if sum == k {
                return true
            } else if sum < k {
                start += 1
            } else {
                end -= 1
            }
        }
        
        return false
    }
    
    func inorder(_ root: TreeNode?, _ nodes: inout [TreeNode]) -> Void {
        if root == nil {
            return
        }
        
        inorder(root!.left, &nodes)
        nodes.append(root!)
        inorder(root!.right, &nodes)
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(5)
        let a1 = TreeNode.init(3)
        a0.left = a1
        let a2 = TreeNode.init(6)
        a0.right = a2
        let a3 = TreeNode.init(2)
        a1.left = a3
        let a4 = TreeNode.init(4)
        a1.right = a4
        let a6 = TreeNode.init(7)
        a2.right = a6
        
        print(findTarget(a0, 9))
        print(findTarget(a0, 28))
    }
}
