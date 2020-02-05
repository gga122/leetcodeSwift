//
//  PlusOneLinkedList.swift
//  leetcode
//
//  Created by MickyZhu on 6/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class PlusOneLinkedListSolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func plusOne(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        let lowNode = reverse(head)
        
        var carry = false
        var node = lowNode
        while let n = node {
            n.val += 1
            carry = n.val > 9
            if carry {
                n.val -= 10
            }
            
            if !carry {
                break
            } else {
                if node?.next == nil {
                    node?.next = ListNode.init(1)
                    break
                }
                
                node = node?.next
            }
        }
        
        let highNode = reverse(lowNode)
        
        return highNode
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
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
//        let a0 = ListNode.init(1)
//        let a1 = ListNode.init(2)
//        a0.next = a1
//        let a2 = ListNode.init(3)
//        a1.next = a2
//        print(plusOne(a0))
        
        let b0 = ListNode.init(9)
        print(plusOne(b0))
    }
}
