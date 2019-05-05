//
//  DesignHashMap.swift
//  leetcode
//
//  Created by Henry on 2019/5/6.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DesignHashMapMyHashMap {
    
    /** Initialize your data structure here. */
    var array = Array<Array<(key: Int, value: Int)>>.init()
    let k = 10
    init() {
        var i = 0
        while i < 10 {
            array.append([(Int, Int)]())
            i += 1
        }
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        var chunk = array[key % k]
        var i = 0
        while i < chunk.count {
            if chunk[i].key == key {
                chunk[i].value = value
                array[key % k] = chunk // Fuck swift, Array is value type!!!
                return
            }
            i += 1
        }
        
        chunk.append((key, value))
        array[key % k] = chunk
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        var chunk = array[key % k]
        var i = 0
        while i < chunk.count {
            if chunk[i].key == key {
                return chunk[i].value
            }
            i += 1
        }
        
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        var chunk = array[key % k]
        var i = 0
        while i < chunk.count {
            if chunk[i].key == key {
                chunk.remove(at: i)
                array[key % k] = chunk // Fuck swift, Array is value type!!!
                return
            }
            i += 1
        }
    }
}

