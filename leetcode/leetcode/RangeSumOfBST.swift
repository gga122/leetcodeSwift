//
//  RangeSumOfBST.swift
//  leetcode
//
//  Created by Henry on 2019/4/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RangeSumOfBSTSolution {
    
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
    
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        if root == nil {
            return 0
        }
        
        var sum = 0
        if root!.val <= R && root!.val >= L {
            sum += root!.val
        }
        
        sum += rangeSumBST(root?.left, L, R);
        sum += rangeSumBST(root?.right, L, R);
        return sum
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(10)
        let a1 = TreeNode.init(5)
        a0.left = a1
        let a2 = TreeNode.init(15)
        a0.right = a2
        let a3 = TreeNode.init(3)
        a1.left = a3
        let a4 = TreeNode.init(7)
        a1.right = a4
        let a5 = TreeNode.init(18)
        a2.right = a5
        print(rangeSumBST(a0, 7, 15))
    }
}
