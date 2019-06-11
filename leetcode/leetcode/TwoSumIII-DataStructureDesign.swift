//
//  TwoSumIII-DataStructureDesign.swift
//  leetcode
//
//  Created by Henry on 2019/6/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TwoSumIII_DataStructureDesign {
    
    /** Initialize your data structure here. */
    var hashs = [Int: Int]()
    
    init() {
        
    }
    
    /** Add the number to an internal data structure.. */
    func add(_ number: Int) {
        if let cnt = hashs[number] {
            hashs[number] = cnt + 1
        } else {
            hashs[number] = 1
        }
    }
    
    /** Find if there exists any pair of numbers which sum is equal to the value. */
    func find(_ value: Int) -> Bool {
        for (k,v) in hashs {
            let remain = value - k
            if hashs[remain] != nil {
                if remain != k {
                    return true
                } else {
                    return v > 1
                }
            }
        }
        
        return false
    }
    
    func test() -> Void {
        add(1)
        add(3)
        add(5)
        print(find(4))
        print(find(7))
    }
}


