//
//  SwapNodesInPairs.swift
//  leetcode
//
//  Created by Henry on 2019/5/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SwapNodesInPairsSolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let dummy = ListNode.init(0)
        dummy.next = head
        var start: ListNode? = dummy
        while let next = start?.next, let nextNext = next.next {
            /* 0 -> 2 */
            start!.next = nextNext
            /* 1 -> 3 */
            next.next = nextNext.next
            /* 2 -> 1 */
            nextNext.next = next

            /* 0 => 1 */
            start = next
        }
        
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
        
        print(swapPairs(a0)!)
    }
}
