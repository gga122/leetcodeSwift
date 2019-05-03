//
//  Leaf-SimilarTrees.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class Leaf_SimilarTreesSolution {
    
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
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        let leafValues1 = getLeafNodeValues(root1)
        let leafValues2 = getLeafNodeValues(root2)
        return leafValues1 == leafValues2
    }
    
    func getLeafNodeValues(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        if root!.left == nil && root!.right == nil {
            return [root!.val]
        }
        
        let leftLeafs = getLeafNodeValues(root!.left)
        let rightLeafs = getLeafNodeValues(root!.right)
        return leftLeafs + rightLeafs
    }
}
