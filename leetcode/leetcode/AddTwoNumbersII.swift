//
//  AddTwoNumbersII.swift
//  leetcode
//
//  Created by Henry on 2019/5/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AddTwoNumbersIISolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var stack1 = [ListNode]()
        var l1 = l1
        while l1 != nil {
            stack1.append(l1!)
            l1 = l1?.next
        }
        var stack2 = [ListNode]()
        var l2 = l2
        while l2 != nil {
            stack2.append(l2!)
            l2 = l2?.next
        }
        
        var result = [ListNode]()
        var carry = 0
        while !stack1.isEmpty || !stack2.isEmpty || carry != 0 {
            let v1 = stack1.isEmpty ? 0 : stack1.removeLast().val
            let v2 = stack2.isEmpty ? 0 : stack2.removeLast().val
            var val = v1 + v2 + carry
            carry = val / 10
            val = val % 10
            let node = ListNode.init(val)
            result.append(node)
        }
        
        let head = result.removeLast()
        var sp = head
        while !result.isEmpty {
            sp.next = result.removeLast()
            sp = sp.next!
        }
        
        return head
    }
    
    func test() -> Void {
        let a0 = ListNode.init(7)
        let a1 = ListNode.init(2)
        a0.next = a1
        let a2 = ListNode.init(4)
        a1.next = a2
        let a3 = ListNode.init(3)
        a2.next = a3
        
        let b0 = ListNode.init(5)
        let b1 = ListNode.init(6)
        b0.next = b1
        let b2 = ListNode.init(4)
        b1.next = b2
        
        print(addTwoNumbers(a0, b0)!)
    }
}
