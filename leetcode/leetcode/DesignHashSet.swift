//
//  DesignHashSet.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DesignHashSetMyHashSet {
    
    /** Initialize your data structure here. */
    var array = Array<Array<Int>>.init()
    let k = 10
    init() {
        var i = 0
        while i < 10 {
            array.append([Int]())
            i += 1
        }
    }
    
    func add(_ key: Int) {
        if contains(key) {
            return
        }
        array[key % k].append(key)
    }
    
    func remove(_ key: Int) {
        if !contains(key) {
            return
        }
        var chunk = array[key % k]
        var i = 0
        while i < chunk.count {
            if chunk[i] == key {
                chunk.remove(at: i)
                array[key % k] = chunk // Fuck swift, Array is value type!!!
                return
            }
            i += 1
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let chunk = array[key % k]
        for i in chunk {
            if i == key {
                return true
            }
        }
        return false
    }
    
    func test() -> Void {
        self.add(1)
        self.add(2)
        print(self.contains(1))
        print(self.contains(3))
        self.add(2)
        print(self.contains(2))
        self.remove(2)
        print(self.contains(2))
    }
}

