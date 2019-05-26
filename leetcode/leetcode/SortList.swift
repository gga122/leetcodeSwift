//
//  SortList.swift
//  leetcode
//
//  Created by Henry on 2019/5/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SortListSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        /* Find mid */
        let dummy = ListNode.init(Int.max)
        dummy.next = head
        var fast = dummy.next!.next
        var slow = dummy.next
        while fast?.next != nil {
            fast = fast!.next!.next
            slow = slow?.next
        }
        
        /* Sort left part and right part */
        let midStart = slow!.next
        slow?.next = nil
        var left = sortList(head)
        var right = sortList(midStart)
        
        if left == nil {
            return right
        }
        if right == nil {
            return left
        }
        
        /* Merge two sorted parts */
        var visitorHead = ListNode.init(Int.min)
        let dummyHead = visitorHead
        while left != nil && right != nil {
            if left!.val < right!.val {
                visitorHead.next = left
                visitorHead = visitorHead.next!
                left = left!.next
            } else {
                visitorHead.next = right
                visitorHead = visitorHead.next!
                right = right!.next
            }
        }
        if left != nil {
            visitorHead.next = left
        } else if right != nil {
            visitorHead.next = right
        }
        
        return dummyHead.next
    }
    
    func test() -> Void {
        let a0 = ListNode.init(4)
        let a1 = ListNode.init(2)
        a0.next = a1
        let a2 = ListNode.init(1)
        a1.next = a2
        let a3 = ListNode.init(3)
        a2.next = a3
        print(sortList(a0)!)
        
        let b0 = ListNode.init(-1)
        let b1 = ListNode.init(5)
        b0.next = b1
        let b2 = ListNode.init(3)
        b1.next = b2
        let b3 = ListNode.init(4)
        b2.next = b3
        let b4 = ListNode.init(0)
        b3.next = b4
        print(sortList(b0)!)
    }
}
