//
//  ConstructStringFromBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConstructStringFromBinaryTreeSolution {
    
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
    
    func tree2str(_ t: TreeNode?) -> String {
        if t == nil {
            return ""
        }
        
        var currentStr = "\(t!.val)"
        if t!.left != nil || t!.right != nil {
            currentStr += "("
            let left = tree2str(t!.left)
            currentStr += left
            currentStr += ")"
            if t!.right != nil {
                currentStr += "("
                let right = tree2str(t!.right)
                currentStr += right
                currentStr += ")"
            }
        }
        
        return currentStr
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        let a3 = TreeNode.init(4)
        a1.left = a3
        
        print(tree2str(a0))
    }
}
