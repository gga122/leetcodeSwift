//
//  MinStack.swift
//  leetcode
//
//  Created by Henry on 2019/4/25.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinStack {
    
    var array = [Int]()
    var mins = [Int]()
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        array.append(x)
        if mins.isEmpty {
            mins.append(x)
        } else {
            if x <= mins.last! {
                mins.append(x)
            } else {
                mins.append(mins.last!)
            }
        }
    }
    
    func pop() {
        mins.removeLast()
        array.removeLast()
    }
    
    func top() -> Int {
        return array.last!
    }
    
    func getMin() -> Int {
        return mins.last!
    }
    
    func test() -> Void {
        self.push(-2)
        self.push(0)
        self.push(-3)
        print(self.getMin())
        self.pop()
        print(self.top())
        print(self.getMin())
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
