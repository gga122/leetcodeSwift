//
//  MiddleOfTheLinkedList.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MiddleOfTheLinkedListSolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil;
        }
        if head!.next == nil {
            return head
        }

        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    func test() -> Void {
        let a0 = ListNode.init(1)
        let a1 = ListNode.init(2)
        a0.next = a1
        let a2 = ListNode.init(3)
        a1.next = a2
        let a3 = ListNode.init(4)
        a2.next = a3
        let a4 = ListNode.init(5)
        a3.next = a4
        print(middleNode(a0)!.val)
        
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
        print(middleNode(b0)!.val)
    }
}
