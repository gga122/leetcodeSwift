//
//  BinaryTreePaths.swift
//  leetcode
//
//  Created by Henry on 2019/4/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryTreePathsSolution {
    
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
 
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        
        var result = [String]()
        if root.left == nil && root.right == nil {
            result.append("\(root.val)")
            return result
        }
        if root.left != nil {
            for s in binaryTreePaths(root.left) {
                result.append("\(root.val)" + "->" + s)
            }
        }
        if root.right != nil {
            for s in binaryTreePaths(root.right) {
                result.append("\(root.val)" + "->" + s)
            }
        }
        
        return result
    }
    
    func test() -> Void {
        let n0 = TreeNode.init(1)
        let n1 = TreeNode.init(2)
        n0.left = n1
        let n2 = TreeNode.init(3)
        n0.right = n2
        let n3 = TreeNode.init(5)
        n1.left = n3
        
        print(binaryTreePaths(n0))
    }
}
