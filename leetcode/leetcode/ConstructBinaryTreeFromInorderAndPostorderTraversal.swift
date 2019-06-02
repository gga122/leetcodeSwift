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
        return builder(inStart: 0, inEnd: inorder.count - 1, postStart: 0, postEnd: postorder.count - 1, inorder, postorder)
    }
    
    func builder(inStart:Int, inEnd:Int, postStart:Int, postEnd:Int, _ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if postStart > postEnd {
            return nil
        }
        
        let rootValue = postorder[postEnd]
        let rootNode = TreeNode(rootValue)
        
        let rootIndex:Int = {
            for i in inStart...inEnd {
                if rootValue == inorder[i] {
                    return i
                }
            }
            
            fatalError()
        }()
        
        rootNode.left = builder(inStart: inStart, inEnd: rootIndex - 1, postStart: postStart, postEnd: postStart + rootIndex - 1 - inStart, inorder, postorder)
        rootNode.right = builder(inStart: rootIndex + 1, inEnd: inEnd, postStart: postEnd - inEnd + rootIndex, postEnd: postEnd - 1, inorder, postorder)
        
        return rootNode
    }

    func test() -> Void {
        print(buildTree([9,3,15,20,7], [9,15,7,20,3])!)
        print(buildTree([3,2,1], [3,2,1])!)
        print(buildTree([1,2,3,4], [3,2,4,1])!)
    }
}
