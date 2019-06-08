//
//  MergeKSortedLists.swift
//  leetcode
//
//  Created by Henry on 2019/6/8.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MergeKSortedListsSolution {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        if lists.count == 1 {
            return lists[0]
        }
        if lists.count == 2 {
            return mergeTwoList(lists[0], lists[1])
        }
        
        let midIndex = lists.count / 2
        let left = Array(lists[0...midIndex])
        let right = Array(lists[midIndex+1..<lists.count])
        
        let leftList = mergeKLists(left)
        let rightList = mergeKLists(right)
        
        let ret = mergeTwoList(leftList, rightList)
        return ret
    }
    
    func mergeTwoList(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        
        var l1 = list1
        var l2 = list2
        
        var begin: ListNode? = nil
        var node: ListNode? = nil
        while l1 != nil || l2 != nil {
            var currentNode: ListNode? = nil
            if l1 == nil {
                currentNode = l2
                l2 = l2!.next
            } else if l2 == nil {
                currentNode = l1
                l1 = l1!.next
            } else if l1!.val < l2!.val {
                currentNode = l1
                l1 = l1!.next
            } else {
                currentNode = l2
                l2 = l2!.next
            }
            
            if node == nil {
                begin = currentNode
                node = currentNode
            } else {
                node!.next = currentNode
                node = currentNode
            }
        }
        
        return begin
    }
    
    func test() -> Void {
        let a0 = ListNode.init(1)
        let a1 = ListNode.init(4)
        a0.next = a1
        let a2 = ListNode.init(5)
        a1.next = a2
        let b0 = ListNode.init(1)
        let b1 = ListNode.init(3)
        b0.next = b1
        let b2 = ListNode.init(4)
        b1.next = b2
        let c0 = ListNode.init(2)
        let c1 = ListNode.init(6)
        c0.next = c1
        print(mergeKLists([a0, b0, c0])!)
    }
}
