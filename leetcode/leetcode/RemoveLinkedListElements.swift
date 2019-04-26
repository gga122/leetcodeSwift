//
//  RemoveLinkedListElements.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RemoveLinkedListElementsSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var head = head
        var header: ListNode? = nil
        var previous: ListNode? = nil
        while head != nil {
            if head!.val != val {
                if header == nil {
                    header = head
                }
                previous = head
            } else {
                previous?.next = head?.next
            }
            head = head!.next
        }
        
        return header
    }
    
    func test() -> Void {
        let a0 = ListNode.init(1)
        let a1 = ListNode.init(2)
        a0.next = a1
        let a2 = ListNode.init(6)
        a1.next = a2
        let a3 = ListNode.init(3)
        a2.next = a3
        let a4 = ListNode.init(4)
        a3.next = a4
        let a5 = ListNode.init(5)
        a4.next = a5
        let a6 = ListNode.init(6)
        a5.next = a6
        print(removeElements(a0, 6))
    }
}
