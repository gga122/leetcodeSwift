//
//  LRUCache.swift
//  leetcode
//
//  Created by Henry on 2019/6/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LRUCache {
    
    public class ListNode {
        public var val: Int
        public var key: Int
        public weak var next: ListNode?
        public weak var previous: ListNode?
        public init(_ val: Int, _ key: Int) {
            self.val = val
            self.key = key
            self.next = nil
            self.previous = nil
        }
    }
    
    var capacity = Int.max
    var hash = [Int: ListNode]()   /* key, index */
    var count = 0
    weak var begin: ListNode? = nil
    weak var end: ListNode? = nil
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = hash[key] {
            if node.key == begin!.key {
                return node.val
            }
            
            if node.key == end!.key {
                end = end?.previous
            }
            
            node.previous?.next = node.next
            node.next?.previous = node.previous
            node.previous = nil
            node.next = begin
            begin?.previous = node
            begin = node
            
            return node.val
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = hash[key] {
            if node.key == begin!.key {
                node.val = value
                return
            }
            
            if node.key == end!.key {
                end = end?.previous
            }
            
            node.previous?.next = node.next
            node.next?.previous = node.previous
            node.previous = nil
            node.next = begin
            begin?.previous = node
            begin = node
            node.val = value
        } else {
            if count == capacity {
                if let tmpEnd = end {
                    end = end!.previous
                    tmpEnd.previous?.next = nil
                    tmpEnd.previous = nil
                    hash[tmpEnd.key] = nil
                    count -= 1
                }
            }
            
            let node = ListNode.init(value, key)
            hash[key] = node
            node.next = begin
            begin?.previous = node
            begin = node
            if count == 0 {
                end = node
            }
            count += 1
        }
    }
    
    func test() -> Void {
        /*
        self.put(1, 1)
        self.put(2, 2)
        print(self.get(1))
        self.put(3, 3)
        print(self.get(2))
        self.put(4, 4)
        print(self.get(1))
        print(self.get(3))
        print(self.get(4))
         */
        
        /*
        self.put(2, 1)
        print(self.get(2))
        self.put(3, 2)
        print(self.get(2))
        print(self.get(3))
        */
        
        self.put(2, 1)
        self.put(1, 1)
        self.put(2, 3)
        self.put(4, 1)
        print(self.get(1))
        print(self.get(2))
    }
}
