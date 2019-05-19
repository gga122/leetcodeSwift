//
//  DistributeCoinsInBinaryTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DistributeCoinsInBinaryTreeSolution {
    
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
 
    func distributeCoins(_ root: TreeNode?) -> Int {
        var cost = 0
        dfs(root, cost: &cost)
        return cost
    }
    
    func dfs(_ root: TreeNode?, cost: inout Int) -> Int {
        if root == nil {
            return 0
        }
        
        let leftOverloadCount = dfs(root!.left, cost: &cost)
        let rightOverloadCount = dfs(root!.right, cost: &cost)
        
        /* No matter less than or greater than, total cost MUST calculate the abs. */
        cost += abs(leftOverloadCount) + abs(rightOverloadCount)
        /* Overload count of current node */
        return leftOverloadCount + rightOverloadCount + (root!.val - 1)
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(3)
        let a1 = TreeNode.init(0)
        a0.left = a1
        let a2 = TreeNode.init(0)
        a0.right = a2
        print(distributeCoins(a0))
    }
}
