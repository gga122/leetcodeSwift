//
//  MergeTwoSortedLists.swift
//  leetcode
//
//  Created by Henry on 2019/4/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MergeTwoSortedListsSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l2 == nil {
            return l1
        }
        if l1 == nil {
            return l2
        }
        
        var l1 = l1
        var l2 = l2
        
        var begin: ListNode? = nil
        var node: ListNode? = nil
        while l1 != nil || l2 != nil {
            var currentNode: ListNode? = nil
            if l1 == nil {
                currentNode = l2
                l2 = l2!.next
            } else if l2 == nil {
                currentNode = l1
                l1 = l1!.next
            } else if l1!.val < l2!.val {
                currentNode = l1
                l1 = l1!.next
            } else {
                currentNode = l2
                l2 = l2!.next
            }
            
            if node == nil {
                node = currentNode
                begin = currentNode
            } else {
                node!.next = currentNode
                node = currentNode
            }
        }
        
        return begin
    }
    
    func test() -> Void {
        let n0 = ListNode.init(1)
        let n1 = ListNode.init(2)
        n0.next = n1
        let n2 = ListNode.init(4)
        n1.next = n2
        
        let m0 = ListNode.init(1)
        let m1 = ListNode.init(3)
        m0.next = m1
        let m2 = ListNode.init(4)
        m1.next = m2
        
        print(mergeTwoLists(m0, n0)!)
    }
}
