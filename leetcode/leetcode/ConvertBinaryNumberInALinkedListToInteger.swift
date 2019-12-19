//
//  ConvertBinaryNumberInALinkedListToInteger.swift
//  leetcode
//
//  Created by MickyZhu on 17/12/2019.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConvertBinaryNumberInALinkedListToIntegerSolution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func getDecimalValue(_ head: ListNode?) -> Int {
        if head == nil {
            return 0
        }
        
        var start = head
        var retValue = 0
        while start != nil {
            retValue *= 2
            retValue += start!.val
            start = start?.next
        }
        
        return retValue
    }
    
    func test() -> Void {
        let node = ListNode.init(1)
        node.next = ListNode.init(0)
        node.next!.next = ListNode.init(1)
        print(getDecimalValue(node))
    }
}
