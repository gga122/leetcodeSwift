//
//  LemonadeChange.swift
//  leetcode
//
//  Created by Henry on 2019/5/9.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LemonadeChangeSolution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        if bills.count == 0 {
            return false
        }
        if bills.first! != 5 {
            return false
        }
        
        let units = [10, 5]
        var cash = [5: 0, 10: 0, 20: 0]
        for bill in bills {
            var change = bill - 5
            var i = 0
            while change > 0 && cash.count > 0 && i < units.count {
                let unit = units[i]
                let count = cash[unit]
                if count == 0 {
                    i += 1
                } else {
                    if change >= unit {
                        change -= unit
                        cash[unit] = cash[unit]! - 1
                    } else {
                        i += 1
                    }
                }
            }
            
            if change != 0 {
                return false
            }
            
            cash[bill] = cash[bill]! + 1
        }
        
        return true
    }
    
    func test() -> Void {
        print(lemonadeChange([5, 5, 5, 10, 20]))
        print(lemonadeChange([5, 5, 10]))
        print(lemonadeChange([10, 10]))
        print(lemonadeChange([5, 5, 10, 10, 20]))
    }
}
