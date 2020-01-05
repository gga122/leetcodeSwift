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
     
 
    func test() -> Void {
        print(getPermutation(3, 3))
        print(getPermutation(4, 9))
        print(getPermutation(9, 116907))
    }
}
