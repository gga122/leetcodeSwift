//
//  RotateString.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RotateStringSolution {
    func rotateString(_ A: String, _ B: String) -> Bool {
        if A.count != B.count {
            return false
        }
        if A.count == 0 {
            return true
        }
        if A.count == 1 {
            return A.first! == B.first!
        }
        
        let rotateCount = A.count - 1
        let charsA = Array(A)
        let charsB = Array(B)
        var equal = true
        for i in 0...rotateCount {
            var aIndex = i
            equal = true
            for j in 0..<charsB.count {
                if aIndex >= charsA.count {
                    aIndex -= charsA.count
                }
                if charsA[aIndex] != charsB[j] {
                    equal = false
                    break
                } else {
                    aIndex += 1
                }
            }
            if equal {
                break
            }
        }
        
        return equal
    }
    
    func test() -> Void {
        print(rotateString("abcde", "cdeab"))
        print(rotateString("abcde", "abced"))
    }
}
