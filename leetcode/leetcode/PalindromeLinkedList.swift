//
//  PalindromeLinkedList.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PalindromeLinkedListSolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return true
        }
        
        /* find mid */
        var head = head
        var fast = head
        var slow = head
        while let s = slow!.next, let f = fast!.next?.next {
            slow = s
            fast = f
        }
        
        /* reverse the end part */
        slow = reverse(slow?.next)
        
        /* compare */
        while slow != nil {
            if slow!.val != head!.val {
                return false
            }
            
            head = head?.next
            slow = slow?.next
        }
        
        return true
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        if head == nil || head!.next == nil {
            return head
        }
        
        var head = head
        var previous: ListNode? = nil
        while head != nil {
            let next = head!.next
            head!.next = previous
            previous = head
            head = next
        }
        
        return previous
    }
    
    func test() -> Void {
        let a0 = ListNode.init(1)
        let a1 = ListNode.init(2)
        a0.next = a1
        print(isPalindrome(a0))
        let b0 = ListNode.init(1)
        let b1 = ListNode.init(2)
        b0.next = b1
        let b2 = ListNode.init(2)
        b1.next = b2
        let b3 = ListNode.init(1)
        b2.next = b3
        print(isPalindrome(b0))
    }
}
