//
//  AddBinary.swift
//  leetcode
//
//  Created by Henry on 2019/4/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AddBinarySolution {
    func addBinary(_ a: String, _ b: String) -> String {
        var long: String? = nil
        var short: String? = nil
        if a.count > b.count {
            long = a
            short = b
        } else {
            long = b
            short = a
        }
        
        var carry = false
        var result = String.init()
        var longReverseIndex = long!.endIndex
        var shortReverseIndex = short!.endIndex
        repeat {
            longReverseIndex = long!.index(before: longReverseIndex)
            shortReverseIndex = short!.index(before: shortReverseIndex)
            
            let lc = long![longReverseIndex]
            let sc = short![shortReverseIndex]
            
            var c = "0";
            if (lc == "0" && sc == "0") {
                if (carry) {
                    c = "1"
                    carry = false
                }
            } else if (lc == "0" && sc == "1") || (lc == "1" && sc == "0") {
                c = carry ? "0" : "1"
            } else {
                c = carry ? "1" : "0"
                carry = true
            }
            
            result.append(c)
            
        } while longReverseIndex > long!.startIndex && shortReverseIndex > short!.startIndex
        
        while longReverseIndex > long!.startIndex {
            longReverseIndex = long!.index(before: longReverseIndex)
            
            let c = long![longReverseIndex]
            if carry {
                if (c == "0") {
                    result.append("1")
                    carry = false
                } else {
                    result.append("0")
                }
            } else {
                result.append(c)
            }
        }
        if carry {
            result.append("1")
        }
        
        return String.init(result.reversed())
    }
    
    func test() -> Void {
        print(addBinary("11", "1"))
        print(addBinary("1010", "1011"))
        print(addBinary("110010", "10111"))
    }
}
