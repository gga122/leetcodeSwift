//
//  MaximumProductOfSplittedBinaryTree.swift
//  leetcode
//
//  Created by MickyZhu on 2/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MaximumProductOfSplittedBinaryTreeSolution {
    
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
    
    let mod: Int64 = 1_000_000_007
    func maxProduct(_ root: TreeNode?) -> Int {
        var sums = [Int64]()
        let total = postOrder(root, &sums)
        
        var res: Int64 = -1
        for i in 0..<sums.count {
            let newRes = sums[i] * (total - sums[i])
            res = max(res, newRes)
        }
        
        print(total)
        print(sums)

        return Int(res % mod)
    }
    
    func postOrder(_ node: TreeNode?, _ sums: inout [Int64]) -> Int64 {
        guard let n = node else {
            return 0
        }
        
        let res = Int64(n.val) + postOrder(n.left, &sums) + postOrder(n.right, &sums)
        sums.append(res)
        return res
    }
}
