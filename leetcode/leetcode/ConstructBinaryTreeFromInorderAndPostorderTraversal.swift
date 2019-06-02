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
        func buildTreeHelper(_ inorder: [Int], _ iStart: Int, _ iEnd: Int, _ postorder: [Int], _ pStart: Int, _ pEnd: Int) -> TreeNode? {
            if iStart > iEnd || pStart > pEnd {
                return nil
            }
            if iStart == iEnd {
                return TreeNode.init(inorder[iStart])
            }
            
            let rootVal = postorder[pEnd]
            let root = TreeNode.init(rootVal)
            let index = inorder.index(of: rootVal)!
            
            let left = buildTreeHelper(inorder, iStart, index-1, postorder, pStart, pStart+index-iStart-1)
            root.left = left
            
            let right = buildTreeHelper(inorder, index+1, iEnd, postorder, pEnd-iEnd+index, pEnd-1)
            root.right = right
            
            return root
        }
        
        let root = buildTreeHelper(inorder, 0, inorder.count-1, postorder, 0, postorder.count-1)
        return root
    }

    func test() -> Void {
        print(buildTree([9,3,15,20,7], [9,15,7,20,3])!)
        print(buildTree([3,2,1], [3,2,1])!)
        print(buildTree([1,2,3,4], [3,2,4,1])!)
    }
}
