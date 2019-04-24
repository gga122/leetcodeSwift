//
//  RemoveDuplicatesFromSortedList.swift
//  leetcode
//
//  Created by Henry on 2019/4/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RemoveDuplicatesFromSortedListSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
 
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var start = head
        while start.next != nil {
            if start.val == start.next!.val {
                start.next = start.next!.next
            } else {
                start = start.next!
            }
        }
        
        return head
    }
    
    func test() -> Void {
        let n0 = ListNode.init(1)
        let n1 = ListNode.init(1)
        n0.next = n1
        let n2 = ListNode.init(2)
        n1.next = n2
        print(deleteDuplicates(n0)!)
        
        let m0 = ListNode.init(1)
        let m1 = ListNode.init(1)
        m0.next = m1
        let m2 = ListNode.init(2)
        m1.next = m2
        let m3 = ListNode.init(3)
        m2.next = m3
        let m4 = ListNode.init(3)
        m3.next = m4
        print(deleteDuplicates(m0)!)
    }
}
