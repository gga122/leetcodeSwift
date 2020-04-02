//
//  PopulatingNextRightPointersInEachNode.swift
//  leetcode
//
//  Created by mickyzhu on 2020/4/2.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class Solution {

    public class Node {
        public var val: Int
        public var left: Node?
        public var right: Node?
        public var next: Node?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.next = nil
        }
    }
     
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        var leftMost = root
        while leftMost?.left != nil {
            var head = leftMost
            
            while head != nil {
                head?.left?.next = head?.right
                
                if head?.next != nil {
                    head?.right?.next = head?.next?.left
                }
                
                head = head?.next
            }
            
            leftMost = leftMost?.left
        }
        
        return root
    }
}
