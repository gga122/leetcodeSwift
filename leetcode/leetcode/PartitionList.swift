//
//  PartitionList.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PartitionListSolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummyMin = ListNode.init(-1)
        let dummyMax = ListNode.init(-1)
        
        var minNode = dummyMin
        var maxNode = dummyMax
        var node = head
        while node != nil {
            if node!.val < x {
                minNode.next = node
                minNode = node!
            } else {
                maxNode.next = node
                maxNode = node!
            }
            
            node = node?.next
        }
        maxNode.next = nil
        minNode.next = dummyMax.next
        
        return dummyMin.next
    }
    
    func test() -> Void {
        let n0 = ListNode.init(1)
        let n1 = ListNode.init(4)
        n0.next = n1
        let n2 = ListNode.init(3)
        n1.next = n2
        let n3 = ListNode.init(2)
        n2.next = n3
        let n4 = ListNode.init(5)
        n3.next = n4
        let n5 = ListNode.init(2)
        n4.next = n5
        let n = partition(n0, 3)
        print(n)
    }
}
