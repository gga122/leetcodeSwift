//
//  ReverseLinkedListII.swift
//  leetcode
//
//  Created by Henry on 2019/6/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReverseLinkedListIISolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let dummy = ListNode.init(-1)
        dummy.next = head
        
        var current = dummy
        var previous: ListNode? = nil
        for _ in 0..<m {
            previous = current
            current = current.next!
        }
        
        var head = current
        for _ in m..<n {
            let next = current.next
            current.next = next!.next
            next!.next = head
            head = next!
            previous!.next = head
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
        let a4 = ListNode.init(5)
        a3.next = a4
        print(reverseBetween(a0, 2, 4)!)
    }
}
