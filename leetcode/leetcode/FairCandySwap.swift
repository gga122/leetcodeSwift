//
//  FairCandySwap.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FairCandySwapSolution {
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        var sumA = 0
        for n in A {
            sumA += n
        }
        var sumB = 0
        var set = Set<Int>.init()
        for n in B {
            sumB += n
            set.insert(n)
        }
        
        let diff = (sumA - sumB) / 2
        for n in A {
            let v = n - diff
            if set.contains(v) {
                return [n, v]
            }
        }
        
        return []
    }
    
    func test() -> Void {
        print(fairCandySwap([1, 1], [2, 2]))
        print(fairCandySwap([1, 2], [2, 3]))
        print(fairCandySwap([2], [1, 3]))
        print(fairCandySwap([1, 2, 5], [2, 4]))
    }
}
