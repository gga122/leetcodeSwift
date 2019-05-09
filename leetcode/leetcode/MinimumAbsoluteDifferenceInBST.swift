//
//  MinimumAbsoluteDifferenceInBST.swift
//  leetcode
//
//  Created by Henry on 2019/5/9.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinimumAbsoluteDifferenceInBSTSolution {
    
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
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        if root == nil {
            return Int.max
        }
        
        var lastNodeVal = Int.min
        var res = Int.max
        var stack: [TreeNode] = []
        var cur: TreeNode? = root
        while !stack.isEmpty || cur != nil {
            while cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }
            let node = stack.popLast()!
            if lastNodeVal < 0 {
                lastNodeVal = node.val
            } else {
                res = min(res, abs(lastNodeVal - node.val))
                lastNodeVal = node.val
            }
            cur = node.right
        }
        return res
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(1)
        let a2 = TreeNode.init(3)
        a0.right = a2
        let a6 = TreeNode.init(2)
        a2.left = a6
        
        print(getMinimumDifference(a0))
    }
}
