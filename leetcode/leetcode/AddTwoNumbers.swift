//
//  AddTwoNumbers.swift
//  leetcode
//
//  Created by Henry on 2019/4/14.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation


class AddTwoNumbersSolution {
    
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1 = l1
        var n2 = l2
        let dummy = ListNode.init(0)
        var current = dummy
        var carry = 0
        while n1 !=  nil || n2 != nil {
            let x = (n1 != nil ? n1!.val : 0)
            let y = (n2 != nil ? n2!.val : 0)
            var sum = x + y + carry
            carry = sum / 10
            sum -= carry * 10  
            let node = ListNode.init(sum)
            current.next = node
            current = node
            if dummy.next == nil {
                dummy.next = current
            }
            
            n1 = n1?.next
            n2 = n2?.next
        }
        if carry != 0 {
            let high = ListNode.init(carry)
            current.next = high
        }
        
        return dummy.next
    }
    
    func test() -> Void {
        let num1_1 = ListNode.init(2)
        let num1_2 = ListNode.init(4)
        num1_1.next = num1_2
        let num1_3 = ListNode.init(3)
        num1_2.next = num1_3
        
        let num2_1 = ListNode.init(5)
        let num2_2 = ListNode.init(6)
        num2_1.next = num2_2
        let num2_3 = ListNode.init(4)
        num2_2.next = num2_3
        
        var result = addTwoNumbers(num2_1, num2_3)
        while result != nil {
            print(result!.val)
            result = result!.next
        }
    }
    
}
