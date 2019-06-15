//
//  main.swift
//  bytedance
//
//  Created by Henry on 2019/5/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

/*
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = (end - start) / 2 + start
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        return -1
    }
    
    func test() -> Void {
        print(search([-1, 0, 3, 5, 9, 12], 9))
    }
}
*/

/*
class Solution {
    
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
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        
        let mid = nums.count / 2
        let root = TreeNode.init(nums[mid])
        let leftPart = Array(nums[0..<mid])
        root.left = sortedArrayToBST(leftPart)
        let rightPart = Array(nums[mid+1..<nums.count])
        root.right = sortedArrayToBST(rightPart)
        
        return root
    }
    
    func test() -> Void {
        print(sortedArrayToBST([-10,-3,0,5,9])!)
    }
}
 */

/*
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }
        
        var ret = [[Int]]()
        backTracking(&ret, nums, [], 0)
        ret.append([])
        return ret
    }
    
    func backTracking(_ result: inout [[Int]], _ nums: [Int], _ tmp: [Int], _ length: Int) -> Void {
        if length >= nums.count {
            return
        } else {
            for i in length..<nums.count {
                var tmp = tmp
                tmp.append(nums[i])
                result.append(tmp)
                backTracking(&result, nums, tmp, i + 1)
            }
        }
    }
    
    func test() -> Void {
        print(subsets([1,2,3]))
    }
}
*/

/*
class MyQueue {
    
    /** Initialize your data structure here. */
    var stack1 = [Int]()
    var stack2 = [Int]()
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack1.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if !stack2.isEmpty {
            return stack2.removeLast()
        }
        
        while !stack1.isEmpty {
            stack2.append(stack1.removeLast())
        }
        return stack2.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if !stack2.isEmpty {
            return stack2.last!
        }
        
        while !stack1.isEmpty {
            stack2.append(stack1.removeLast())
        }
        return stack2.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}
*/

/*
class Solution {
    
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
    
    func nextLevelNodes(_ nodes: [TreeNode]) -> [TreeNode] {
        if nodes.isEmpty {
            return []
        }
        
        var subNodes = [TreeNode]()
        for node in nodes {
            if let left = node.left {
                subNodes.append(left)
            }
            if let right = node.right {
                subNodes.append(right)
            }
        }
        
        return subNodes
    }
    
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var nodes: [TreeNode] = [root!]
        while !nodes.isEmpty {
            let subNodes = nextLevelNodes(nodes)
            if subNodes.isEmpty {
                return nodes.first!.val
            } else {
                nodes = subNodes
            }
        }
        
        return 0
    }
}
*/

/*
class Solution {
    
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
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.count == 0 || postorder.count == 0 {
            return nil
        }
        
        let rootIndexInPost = postorder.count - 1
        let rootVal = postorder[rootIndexInPost]
        let root = TreeNode.init(rootVal)
        
        let rootIndexInIn = inorder.firstIndex(of: rootVal)!
        let leftPartInInorder = Array(inorder[0..<rootIndexInIn])
        let leftPartInPostorder = Array(postorder[0..<rootIndexInIn])
        let left = buildTree(leftPartInInorder, leftPartInPostorder)
        root.left = left
        
        let rightPartInInorder = Array(inorder[rootIndexInIn+1..<inorder.count])
        let rightPartInPostorder = Array(postorder[leftPartInInorder.count..<postorder.count-1])
        let right = buildTree(rightPartInInorder, rightPartInPostorder)
        root.right = right
        
        return root
    }
    
    func test() -> Void {
        let tree = buildTree([9,3,15,20,7], [9,15,7,20,3])
        print(tree)
    }
}
*/

//Solution.init().test()

