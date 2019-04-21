//
//  oneBitAndTwoBitCharactersSolution.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class oneBitAndTwoBitCharactersSolution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        if bits.count == 0 {
            return false
        }
        if bits.count == 1 {
            return bits.first == 0
        }
        if bits.last! != 0 {
            return false
        }
        
        var index = 0
        var oneFlag = false
        while index < bits.count {
            let v = bits[index]
            if v == 0 {
                index += 1
                oneFlag = true
            } else {
                index += 2
                oneFlag = false
            }
        }
        
        if oneFlag {
            return true
        } else {
            if index == bits.count - 1 {
                return true
            } else {
                return false // Overflow
            }
        }
    }
    
    func test() -> Void {
        print(isOneBitCharacter([1, 0, 0]))
        print(isOneBitCharacter([1, 1, 1, 0]))
    }
}
