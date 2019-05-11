//
//  BinaryTreeTilt.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryTreeTiltSolution {

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
    
    func findTilt(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        /* If leaf, tilt is zero */
        if root!.left == nil && root!.right == nil {
            return 0
        }
        
        /* calculate current tilt */
        let leftSum = sum(root!.left)
        let rightSum = sum(root!.right)
        let tilt = abs(leftSum - rightSum)
        var ret = tilt
        /* add left node tilt and right node tilt */
        let leftTilt = findTilt(root!.left)
        let rightTilt = findTilt(root!.right)
        ret += leftTilt + rightTilt
        
        return ret
    }
    
    func sum(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var ret = root!.val
        ret += sum(root!.left)
        ret += sum(root!.right)
        
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(3)
        a0.right = a2
        print(findTilt(a0))
        
        let b0 = TreeNode.init(1)
        let b1 = TreeNode.init(2)
        b0.left = b1
        let b2 = TreeNode.init(3)
        b0.right = b2
        let b3 = TreeNode.init(4)
        b1.left = b3
        let b5 = TreeNode.init(5)
        b2.left = b5
        print(findTilt(b0))
    }
}
