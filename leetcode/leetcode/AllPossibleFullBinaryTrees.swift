//
//  AllPossibleFullBinaryTrees.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AllPossibleFullBinaryTreesSolution {

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
    
    var memo = [Int: [TreeNode?]]()
    
    func allPossibleFBT(_ N: Int) -> [TreeNode?] {
        if let res = memo[N] {
            return res
        } else {
            var ret = [TreeNode?]()
            if N == 1 {
                ret.append(TreeNode.init(0))
            } else if N % 2 == 1 {
                for left in 0..<N {
                    let right = N - 1 - left
                    for leftTree in allPossibleFBT(left) {
                        for rightTree in allPossibleFBT(right) {
                            let node = TreeNode.init(0)
                            node.left = leftTree
                            node.right = rightTree
                            ret.append(node)
                        }
                    }
                }
            }
            memo[N] = ret
            return ret
        }
    }
    
    func test() -> Void {
        print(allPossibleFBT(7))
    }
}
