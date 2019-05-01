//
//  TrimABinarySearchTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation


class TrimABinarySearchTreeSolution {
    
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
    
    func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root!.val < L {
            return trimBST(root!.right, L, R)
        }
        if root!.val > R {
            return trimBST(root!.left, L, R)
        }
        
        root!.left = trimBST(root!.left, L, R)
        root!.right = trimBST(root!.right, L, R)
        
        return root
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(0)
        a0.left = a1
        let a2 = TreeNode.init(2)
        a0.right = a2
        print(trimBST(a0, 1, 2))
        
        let b0 = TreeNode.init(3)
        let b1 = TreeNode.init(0)
        b0.left = b1
        let b2 = TreeNode.init(4)
        b0.right = b2
        let b4 = TreeNode.init(2)
        b1.right = b4
        let b9 = TreeNode.init(1)
        b4.left = b9
        print(trimBST(b0, 1, 3))
    }
}
