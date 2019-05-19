//
//  ComplexNumberMultiplication.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ComplexNumberMultiplicationSolution {
    func complexNumberMultiply(_ a: String, _ b: String) -> String {
        let charsA = Array(a)
        var realA = 0
        var unrealA = 0
        for i in 0..<charsA.count {
            if charsA[i] == "+" {
                realA = Int(String(charsA[0..<i]))!
                unrealA = Int(String(charsA[i+1..<charsA.count-1]))!
                break
            }
        }
        
        let charsB = Array(b)
        var realB = 0
        var unrealB = 0
        for i in 0..<charsB.count {
            if charsB[i] == "+" {
                realB = Int(String(charsB[0..<i]))!
                unrealB = Int(String(charsB[i+1..<charsB.count-1]))!
                break
            }
        }
        
        let real = realA * realB - unrealA * unrealB
        let unreal = realA * unrealB + unrealA * realB
        return "\(real)+\(unreal)i"
    }
    
    func test() -> Void {
        print(complexNumberMultiply("1+1i", "1+1i"))
        print(complexNumberMultiply("1+-1i", "1+-1i"))
        print(complexNumberMultiply("20+22i", "-18+-10i"))
    }
}
