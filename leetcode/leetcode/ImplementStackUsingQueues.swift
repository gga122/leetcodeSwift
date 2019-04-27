//
//  ImplementStackUsingQueues.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ImplementStackUsingQueuesMyStack {
    
    var A = Array<Int>.init()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        A.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        if A.count == 1 {
            return A.removeFirst()
        }
        
        var subA = Array<Int>.init()
        while A.count > 1 {
            subA.append(A.removeFirst())
        }
        
        let v = A.removeFirst()
        A = subA
        return v
    }
    
    /** Get the top element. */
    func top() -> Int {
        if A.count == 1 {
            return A.first!
        }
        
        var subA = Array<Int>.init()
        while A.count > 1 {
            subA.append(A.removeFirst())
        }
        
        let v = A.removeFirst()
        subA.append(v)
        A = subA
        return v
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return A.isEmpty
    }
    
    func test() -> Void {
        let s0 = ImplementStackUsingQueuesMyStack.init()
        s0.push(1)
        s0.push(2)
        print(s0.top())
        print(s0.pop())
        print(s0.empty())
        
        let s1 = ImplementStackUsingQueuesMyStack.init()
        s1.push(1)
        s1.push(2)
        print(s1.top())
        print(s1.push(3))
        print(s1.top())
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
