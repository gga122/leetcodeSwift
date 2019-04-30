//
//  SearchInABinarySearchTree.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SearchInABinarySearchTreeSolution {

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
    
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil || root?.val == val {
            return root
        }
        
        let left = searchBST(root?.left, val)
        if left != nil {
            return left
        }
        let right = searchBST(root?.right, val)
        return right
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(4)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(7)
        a0.right = a2
        let a3 = TreeNode.init(1)
        a1.left = a3
        let a4 = TreeNode.init(3)
        a1.right = a4
        
        print(searchBST(a0, 2))
    }
}
