//
//  2.swift
//  LeetCode
//
//  Created by henry on 2024/10/22.
//

import Foundation

class Solution_2 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        
        var carryFlag = false
        var pivot: ListNode? = nil
        while l1 != nil || l2 != nil || carryFlag {
            var sum = (l1?.val ?? 0) + (l2?.val ?? 0)
            if carryFlag {
                sum += 1
                carryFlag = false
            }
            
            if sum > 9 {
                carryFlag = true
                sum -= 10
            }
            
            let cur = ListNode(sum, pivot)
            pivot = cur
            
            l1 = l1?.next
            l2 = l2?.next
        }

        while pivot?.val == 0, pivot?.next != nil {
            pivot = pivot?.next
        }
        
        let result = reverse(pivot)
        
        return result
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var cur = head
        var previous: ListNode? = nil
        
        while cur != nil {
            let next = cur?.next
            cur?.next = previous
            previous = cur
            cur = next
        }
        
        return previous
    }
}
