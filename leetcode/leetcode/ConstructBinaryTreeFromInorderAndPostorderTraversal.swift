//
//  ConstructBinaryTreeFromInorderAndPostorderTraversal.swift
//  leetcode
//
//  Created by Henry on 2019/6/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConstructBinaryTreeFromInorderAndPostorderTraversalSolution {

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

    /*
     inorder: a+b
     postorder: ab+
     
     the last element in postorder array is root node, find it in inorder array and seperate the array into two parts.
     */
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.count == 0 || postorder.count == 0 {
            return nil
        }
        if inorder.count != postorder.count {
            return nil
        }

        let rootVal = postorder.last!
        let root = TreeNode.init(rootVal)
        let rootIndexInInorder = inorder.index(of: rootVal)!
        
        let inorderLeft = Array(inorder[0..<rootIndexInInorder])
        let postorderLeft = Array(postorder[0..<inorderLeft.count])
        let left = buildTree(inorderLeft, postorderLeft)
        root.left = left
        
        let inorderRight = Array(inorder[rootIndexInInorder+1..<inorder.count])
        let postorderRight = Array(postorder[postorderLeft.count..<postorder.count-1])
        let right = buildTree(inorderRight, postorderRight)
        root.right = right
        
        return root
    }
    
    func test() -> Void {
        print(buildTree([9,3,15,20,7], [9,15,7,20,3])!)
        print(buildTree([3,2,1], [3,2,1])!)
    }
}
