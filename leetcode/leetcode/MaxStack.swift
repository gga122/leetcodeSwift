//
//  MaxStack.swift
//  leetcode
//
//  Created by Henry on 2020/1/16.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MaxStack {

    var stack = [Int]()
    var max = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        
        if max.isEmpty {
            max.append(x)
        } else {
            if x >= max.last! {
                max.append(x)
            } else {
                max.append(max.last!)
            }
        }
    }
    
    func pop() -> Int {
        if stack.isEmpty {
            return Int.min
        }
        
        max.removeLast()
        return stack.removeLast()
    }
    
    func top() -> Int {
        if stack.isEmpty {
            return Int.min
        }
        
        return stack.last!
    }
    
    func peekMax() -> Int {
        if max.isEmpty {
            return Int.min
        }
        
        return max.last!
    }
    
    func popMax() -> Int {
        if max.isEmpty {
            return Int.min
        }
        
        let m = peekMax()
        var tmp = [Int]()
        while !stack.isEmpty {
            let p = pop()
            if p == m {
                break
            } else {
                tmp.append(p)
            }
        }
        
        while !tmp.isEmpty {
            let x = tmp.removeLast()
            push(x)
        }
        
        return m
    }
}

/**
 * Your MaxStack object will be instantiated and called as such:
 * let obj = MaxStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.peekMax()
 * let ret_5: Int = obj.popMax()
 */
