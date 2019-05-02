//
//  PrimeNumberOfSetBitsInBinaryRepresentation.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PrimeNumberOfSetBitsInBinaryRepresentationSolution {
    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        var count = 0
        for i in L...R {
            let nonzeroBitCount = i.nonzeroBitCount
            
            if isPrime(nonzeroBitCount) {
                count += 1
            }
        }
        
        return count
    }
    
    func isPrime(_ num: Int) -> Bool {
        if num <= 1 {
            return false
        }
        
        if num == 2 {
            return true
        }
        
        if num & 1 == 0 {
            return false
        }
        
        var i = 3
        while i * i <= num, num % i != 0 {
            i += 2
        }
        
        return i * i > num
    }
    
    func test() -> Void {
        print(countPrimeSetBits(6, 10))
        print(countPrimeSetBits(10, 15))
        print(countPrimeSetBits(842, 888))
    }
}
