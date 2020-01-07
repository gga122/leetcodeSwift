//
//  PermutationSequence.swift
//  leetcode
//
//  Created by mickyzhu on 2020/1/6.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class PermutationSequenceSolution {
    
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var k = k
        
        let facts = [1,1,2,6,24,120,720,5040,40320,362880]
        var flags = [Bool].init(repeating: false, count: n+1)
        
        var result = [Int]()
        for i in (0..<n).reversed() {
            let v = facts[i]
            let divVal = k / v
            let modVal = k % v
            if divVal > 0 {
                var current = divVal
                if modVal > 0 {
                    current += 1
                }
                
                if flags[current] {
                    for j in 1..<flags.count {
                        if !flags[j] {
                            current = j
                        }
                    }
                }
                
                result.append(current)
                flags[current] = true
            }
            
            k -= (divVal-1) * i
        }
        for j in 1..<flags.count {
            if !flags[j] {
                result.append(j)
            }
        }
        
        var str = ""
        for ele in result {
            str += "\(ele)"
        }
        
        return str
    }
    
    /* 直接回溯会超时
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var results = [[Int]]()
        var usedFlags = [Bool].init(repeating: false, count: n)
        var tmp = [Int]()
        
        backTrack(&results, n, k, &usedFlags, &tmp)
        
        let last = results[k-1]
        var str = ""
        for ele in last {
            str += "\(ele)"
        }
        
        return str
    }
    
    func backTrack(_ result: inout [[Int]], _ n: Int, _ k: Int, _ flags: inout [Bool], _ tmp: inout [Int]) -> Void {
        if result.count == k {
            return
        }
        
        if tmp.count == flags.count {
            result.append(tmp)
            return
        }
        
        for i in 0..<flags.count {
            if flags[i] {
                continue
            }
            
            flags[i] = true
            tmp.append(i+1)
            backTrack(&result, n, k, &flags, &tmp)
            tmp.removeLast()
            flags[i] = false
        }
    }
     */
 
    func test() -> Void {
        print(getPermutation(3, 3))
        print(getPermutation(4, 9))
        print(getPermutation(9, 116907))
    }
}
