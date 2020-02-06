//
//  TwoSumBSTs.swift
//  leetcode
//
//  Created by MickyZhu on 6/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class TwoSumBSTsSolution {

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
    
    func twoSumBSTs(_ root1: TreeNode?, _ root2: TreeNode?, _ target: Int) -> Bool {
        var stack = [TreeNode]()
        var node = root1
        while !stack.isEmpty || node != nil {
            if node != nil {
                stack.append(node!)
                node = node?.left
                continue
            }
            
            node = stack.removeLast()
            let val = target - node!.val
            if find(root2, val) {
                return true
            }
            
            node = node?.right
        }
        
        return false
    }
    
    func find(_ root: TreeNode?, _ target: Int) -> Bool {
        guard let node = root else { return false }
               
        if node.val == target {
            return true
        } else if node.val < target {
            return find(node.right, target)
        } else {
            return find(node.left, target)
        }
    }
}
