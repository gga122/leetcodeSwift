//
//  ImplementQueueUsingStacks.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ImplementQueueUsingStacksMyQueue {
    
    var A = Array<Int>.init()
    var B = Array<Int>.init()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        A.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if !B.isEmpty {
            return B.popLast()!
        }
        
        while !A.isEmpty {
            B.append(A.popLast()!)
        }
        
        return B.popLast()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if !B.isEmpty {
            return B.last!
        }
        
        while !A.isEmpty {
            B.append(A.popLast()!)
        }
        
        return B.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return A.isEmpty && B.isEmpty
    }
    
    func test() -> Void {
        self.push(1)
        self.push(2)
        print(self.peek())
        print(self.pop())
        print(self.empty())
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
