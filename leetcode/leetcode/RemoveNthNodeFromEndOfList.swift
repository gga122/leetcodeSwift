//
//  RemoveNthNodeFromEndOfList.swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RemoveNthNodeFromEndOfListSolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }

        let dummy = ListNode.init(Int.max)
        dummy.next = head
        var length = 0
        var start: ListNode? = dummy
        while start != nil {
            start = start!.next
            length += 1
        }
        
        start = dummy
        var remainCount = length - n - 1
        while remainCount > 0 {
            start = start?.next
            remainCount -= 1
        }
        start?.next = start?.next?.next
        
        return dummy.next
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

        print(removeNthFromEnd(a0, 2) ?? nil)
    }
}
