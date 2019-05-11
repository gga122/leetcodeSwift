//
//  ConvertANumberToHexadecimal.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConvertANumberToHexadecimalSolution {
    func toHex(_ num: Int) -> String {
        if num == 0 {
            return "0"
        }
        
        let hashs: [Int: Character] = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9", 10: "a", 11: "b", 12: "c", 13: "d", 14: "e", 15: "f"]
        
        var ret = ""
        var bitIndex = 0
        var v = 0
        let unit = 15
        while bitIndex <= 7 {
            let mask = unit << ((7 - bitIndex) * 4)
            v |= (num & mask)
            v = v >> ((7 - bitIndex) * 4)
            let c = hashs[v]!
            if ret == "" {
                if c != "0" {
                    ret.append(c)
                }
            } else {
                ret.append(c)
            }
            v = 0
            
            bitIndex += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(toHex(26))
        print(toHex(-1))
    }
}
