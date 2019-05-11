//
//  PathSumIII.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PathSumIIISolution {

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
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        if root == nil {
            return 0
        }
        
        /* Find in current node */
        var ret = sumHelper(root, sum)
        /* Use left node as root */
        ret += pathSum(root!.left, sum)
        /* Use right node as root */
        ret += pathSum(root!.right, sum)
        return ret
    }
    
    func sumHelper(_ root: TreeNode?, _ sum: Int) -> Int {
        if root == nil {
            return 0
        }
        var ret = 0
        if sum == root!.val {
            ret += 1
        }
        ret += sumHelper(root!.left, sum - root!.val)
        ret += sumHelper(root!.right, sum - root!.val)
        
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(10)
        let a1 = TreeNode.init(5)
        a0.left = a1
        let a2 = TreeNode.init(-3)
        a0.right = a2
        let a3 = TreeNode.init(3)
        a1.left = a3
        let a4 = TreeNode.init(2)
        a1.right = a4
        let a6 = TreeNode.init(11)
        a2.right = a6
        let a7 = TreeNode.init(3)
        a3.left = a7
        let a8 = TreeNode.init(-2)
        a3.right = a8
        let a10 = TreeNode.init(1)
        a4.right = a10
        
        print(pathSum(a0, 8))
    }
}
