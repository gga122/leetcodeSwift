//
//  ReorderList.swift
//  leetcode
//
//  Created by Henry on 2019/5/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReorderListSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func reorderList(_ head: ListNode?) {
        if head == nil || head!.next == nil {
            return
        }
        
        /* Find mid */
        let dummy = ListNode.init(Int.max)
        dummy.next = head
        var slow = dummy.next
        var fast = dummy.next!.next
        while fast?.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
        }
    
        /* Reverse right part */
        let rightStart = slow!.next
        slow!.next = nil
        var begin = rightStart
        var previous: ListNode? = nil
        while begin != nil {
            let next = begin?.next
            begin?.next = previous
            previous = begin
            begin = next
        }
        begin = previous
        
        /* Merge left and right */
        var start = dummy.next
        while start != nil && begin != nil {
            let startNext = start!.next
            let beginNext = begin!.next
            start!.next = begin
            begin!.next = startNext
            
            start = startNext
            begin = beginNext
        }
        if begin?.next != nil {
            start?.next = begin
        }
        while start?.next != nil {
            start = start?.next
        }
    }
    
    func test() -> Void {
        let a0 = ListNode.init(1)
        let a1 = ListNode.init(2)
        a0.next = a1
        let a2 = ListNode.init(3)
        a1.next = a2
        let a3 = ListNode.init(4)
        a2.next = a3
        print(reorderList(a0))
        
        let b0 = ListNode.init(1)
        let b1 = ListNode.init(2)
        b0.next = b1
        let b2 = ListNode.init(3)
        b1.next = b2
        let b3 = ListNode.init(4)
        b2.next = b3
        let b4 = ListNode.init(5)
        b3.next = b4
        let b5 = ListNode.init(6)
        b4.next = b5
        let b6 = ListNode.init(7)
        b5.next = b6
        print(reorderList(b0))
    }
}
