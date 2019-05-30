//
//  MaximumSwap.swift
//  leetcode
//
//  Created by Henry on 2019/5/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaximumSwapSolution {
    func maximumSwap(_ num: Int) -> Int {
        if num < 10 {
            return num
        }
        
        var numA = num
        var elements = [Int]()
        while numA > 0 {
            let v = numA % 10
            elements.append(v)
            numA /= 10
        }
        
        var i = elements.count - 1
        while i >= 1 {
            if elements[i] == 9 {
                i -= 1
                continue
            }
            
            var j = i - 1
            var maxIndex = Int.min
            while j >= 0 {
                if elements[j] > elements[i] {
                    if maxIndex == Int.min {
                        maxIndex = j
                    } else {
                        if elements[j] >= elements[maxIndex] {
                            maxIndex = j
                        }
                    }
                }
                j -= 1
            }
            if maxIndex != Int.min {
                elements.swapAt(i, maxIndex)
                break
            }
            
            i -= 1
        }

        var v = elements.removeLast()
        while !elements.isEmpty {
            v *= 10
            v += elements.removeLast()
        }
        
        return v
    }
    
    func test() -> Void {
        print(maximumSwap(2736))
        print(maximumSwap(9973))
        print(maximumSwap(98368))
        print(maximumSwap(2736))
        print(maximumSwap(115))
        print(maximumSwap(1993))
    }
}
