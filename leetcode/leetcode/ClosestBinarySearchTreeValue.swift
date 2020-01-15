//
//  ClosestBinarySearchTreeValue.swift
//  leetcode
//
//  Created by Henry on 2020/1/16.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ClosestBinarySearchTreeValueSolution {
    
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
     
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        if root == nil {
            return Int.max
        }
        
        let leftMinVal = closestValue(root?.left, target)
        let rightMinVal = closestValue(root?.right, target)
        
        let leftDis = abs(Double(leftMinVal) - target)
        let rightDis = abs(Double(rightMinVal) - target)
        let subMin = leftDis > rightDis ? rightMinVal : leftMinVal
        let subDis = abs(Double(subMin) - target)
        let curMis = abs(Double(root!.val) - target)
        
        if curMis < subDis {
            return root!.val
        } else {
            return subMin
        }
    }
    
    func test() -> Void {
        let n0 = TreeNode.init(4)
        let n1 = TreeNode.init(2)
        n0.left = n1
        let n2 = TreeNode.init(5)
        n0.right = n2
        let n3 = TreeNode.init(1)
        n1.left = n3
        let n4 = TreeNode.init(3)
        n1.right = n4
        print(closestValue(n0, 3.714286))
        
        let a0 = TreeNode.init(3)
        let a1 = TreeNode.init(2)
        a0.left = a1
        let a2 = TreeNode.init(4)
        a0.right = a2
        let a3 = TreeNode.init(1)
        a1.left = a3
        print(closestValue(a0, 4.142857))
    }
}
