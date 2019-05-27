//
//  ConstructBinaryTreeFromPreorderAndInorderTraversal.swift
//  leetcode
//
//  Created by Henry on 2019/5/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConstructBinaryTreeFromPreorderAndInorderTraversalSolution {

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
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        
        let root = buildTreeHelper(preorder, 0, preorder.count-1, inorder, 0, inorder.count-1)
        return root
    }
    
    func buildTreeHelper(_ preorder: [Int], _ pStart: Int, _ pEnd: Int, _ inorder: [Int], _ iStart: Int, _ iEnd: Int) -> TreeNode? {
        if pStart > pEnd || iStart > iEnd {
            return nil
        }

        if pStart == pEnd {
            return TreeNode.init(preorder[pStart])
        }
        
        let rootVal = preorder[pStart]
        let root = TreeNode.init(rootVal)
        
        for i in iStart...iEnd {
            if inorder[i] == preorder[pStart] {
                root.left = buildTreeHelper(preorder, pStart+1, pStart+i-iStart, inorder, iStart, i-1)
                root.right = buildTreeHelper(preorder, i-iStart+pStart+1, pEnd, inorder, i+1, iEnd)
                break
            }
        }
    
        return root
    }
    
    func test() -> Void {
        print(buildTree([3,9,20,15,7], [9,3,15,20,7])!)
        print(buildTree([1,2,3], [2,3,1])!)
    }
}
