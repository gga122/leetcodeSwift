//
//  RotateList.swift
//  leetcode
//
//  Created by Henry on 2020/1/14.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class RotateListSolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
     
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil || k == 0 {
            return head
        }
        
        var n2 = head
        var totalSteps = 1
        while n2?.next != nil {
            n2 = n2?.next
            totalSteps += 1
        }
        n2?.next = head

        let moveSteps = totalSteps - k % totalSteps
        for _ in 0..<moveSteps {
            n2 = n2?.next
        }
        let n1 = n2?.next
        n2?.next = nil
        
        return n1
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
        print(rotateRight(a0, 2))
        
        let b0 = ListNode.init(0)
        let b1 = ListNode.init(1)
        b0.next = b1
        let b2 = ListNode.init(2)
        b1.next = b2
        print(rotateRight(b0, 4))
    }
}
