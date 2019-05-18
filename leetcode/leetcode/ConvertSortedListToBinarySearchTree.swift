//
//  ConvertSortedListToBinarySearchTree.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConvertSortedListToBinarySearchTreeSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
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
    
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil {
            return nil
        }
        if head!.next == nil {
            return TreeNode.init(head!.val)
        }
        
        /* find mid node */
        var fast = head
        var slow = head
        var previous: ListNode? = ListNode(Int.min)
        previous!.next = head
        while fast != nil && fast!.next != nil {
            previous = previous!.next
            slow = slow!.next
            fast = fast!.next?.next
        }
        
        let root = TreeNode.init(slow!.val)
        previous?.next = nil
        root.left = sortedListToBST(head)
        root.right = sortedListToBST(slow?.next)
        
        return root
    }
    
    func test() -> Void {
        let a0 = ListNode.init(-10)
        let a1 = ListNode.init(-3)
        a0.next = a1
        let a2 = ListNode.init(0)
        a1.next = a2
        let a3 = ListNode.init(5)
        a2.next = a3
        let a4 = ListNode.init(9)
        a3.next = a4
        
        print(sortedListToBST(a0)!)
    }
}
