//
//  RandomizedSet.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RandomizedSet {

    var set = Set<Int>.init()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        return set.insert(val).inserted
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        return set.remove(val) != nil
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return set.randomElement()!
    }
}
