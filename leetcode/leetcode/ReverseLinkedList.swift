//
//  ReverseLinkedList.swift
//  leetcode
//
//  Created by Henry on 2019/4/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReverseLinkedListSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head;
        }
        
        var current = head
        var previous: ListNode? = nil
        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
        return previous
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
        
        print(reverseList(a0)!)
    }
}
