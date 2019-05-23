//
//  RemoveDuplicatesFromSortedListII.swift
//  leetcode
//
//  Created by Henry on 2019/5/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RemoveDuplicatesFromSortedListIISolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let dummy = ListNode.init(0)
        dummy.next = head
        var start: ListNode? = dummy
        while let next = start?.next, let nextNext = next.next {
            if next.val != nextNext.val {
                start = next
            } else {
                var end = nextNext.next
                while end != nil && next.val == end!.val {
                    end = end!.next
                }
                
                start?.next = end
            }
        }
        
        return dummy.next
    }
    
    func test() -> Void {
        let a0 = ListNode.init(1)
        let a1 = ListNode.init(2)
        a0.next = a1
        let a2 = ListNode.init(3)
        a1.next = a2
        let a3 = ListNode.init(3)
        a2.next = a3
        let a4 = ListNode.init(4)
        a3.next = a4
        let a5 = ListNode.init(4)
        a4.next = a5
        let a6 = ListNode.init(5)
        a5.next = a6
        
        print(deleteDuplicates(a0)!)
    }
}
