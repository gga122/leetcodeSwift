//
//  ReverseNodesInK-Group.swift
//  leetcode
//
//  Created by Henry on 2020/1/19.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ReverseNodesInK_GroupSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
     
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k <= 1 {
            return head
        }
        
        let dummy = ListNode.init(Int.min)
        dummy.next = head
        
        var startNode: ListNode? = dummy
        while startNode != nil {
            startNode = reverse(startNode, k)
        }
        
        return dummy.next
    }
    
    func reverse(_ start: ListNode?, _ k: Int) -> ListNode? {
        if start == nil {
            return nil
        }
        
        var end: ListNode? = start
        var remain = k
        while remain > 0 {
            end = end?.next
            if end == nil && remain > 0 {
                return nil
            }
            
            remain -= 1
        }
        
        let startNext = start?.next
        let endNext = end?.next
        
        /* disconnect sub nodes */
        start?.next = nil
        end?.next = nil
        
        var current = startNext
        var previous: ListNode? = nil
        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
        start?.next = previous
        end = start
        remain = k
        while remain > 0 {
            end = end?.next
            remain -= 1
        }
        end?.next = endNext
        
        return end
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
        print(reverseKGroup(a0, 2))
    }
}
