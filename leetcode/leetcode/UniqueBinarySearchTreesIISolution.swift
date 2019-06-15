//
//  UniqueBinarySearchTreesIISolution.swift
//  leetcode
//
//  Created by Henry on 2019/6/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UniqueBinarySearchTreesIISolution {
    
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

    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        
        let ret = helper(1, n)
        return ret
    }
    
    func helper(_ begin: Int, _ end: Int) -> [TreeNode?] {
        var res = [TreeNode?]()
        if begin > end {
            res.append(nil)
            return res
        }
        for i in begin...end {
            let left = helper(begin, i-1)
            let right = helper(i+1, end)
            for leftIndex in 0..<left.count {
                for rightIndex in 0..<right.count {
                    let node = TreeNode.init(i)
                    node.left = left[leftIndex]
                    node.right = right[rightIndex]
                    res.append(node)
                }
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(generateTrees(3))
    }
}
