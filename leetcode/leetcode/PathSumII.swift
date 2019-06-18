//
//  PathSumII.swift
//  leetcode
//
//  Created by Henry on 2019/6/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PathSumIISolution {

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
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        if root == nil {
            return []
        }
        if root!.left == nil && root!.right == nil {
            if root!.val == sum {
                return [[sum]]
            } else {
                return []
            }
        }
        
        var ret = [[Int]]()
        if let left = root?.left {
            let leftRet = pathSum(left, sum - root!.val)
            if !leftRet.isEmpty {
                for lR in leftRet {
                    let v = [root!.val] + lR
                    ret.append(v)
                }
            }
        }
        if let right = root?.right {
            let rightRet = pathSum(right, sum - root!.val)
            if !rightRet.isEmpty {
                for rR in rightRet {
                    let v = [root!.val] + rR
                    ret.append(v)
                }
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        let a0 = TreeNode.init(5)
        let a1 = TreeNode.init(4)
        a0.left = a1
        let a2 = TreeNode.init(8)
        a0.right = a2
        let a3 = TreeNode.init(11)
        a1.left = a3
        let a5 = TreeNode.init(13)
        a2.left = a5
        let a6 = TreeNode.init(4)
        a2.right = a6
        let a7 = TreeNode.init(7)
        a3.left = a7
        let a8 = TreeNode.init(2)
        a3.right = a8
        let a11 = TreeNode.init(5)
        a6.left = a11
        let a12 = TreeNode.init(1)
        a6.right = a12
        print(pathSum(a0, 22))
    }
}
