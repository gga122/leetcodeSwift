//
//  JumpGameV.swift
//  leetcode
//
//  Created by MickyZhu on 2/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class JumpGameVSolution {
    func maxJumps(_ arr: [Int], _ d: Int) -> Int {
        guard arr.count > 0 else {
            return 0
        }
        
        /* We will jump from lowest to highest */
        let count = arr.count
        var entries = [(Int, Int)].init()
        for i in 0..<count {
            entries.append((arr[i], i))
        }
        entries.sort { (kv1, kv2) -> Bool in
            return kv1.0 < kv2.0
        }
        
        var res = 1
        var dp = [Int].init(repeating: 1, count: count)
        for i in 0..<count {
            let index = entries[i].1
            
            /* Find left part */
            var j = index-1
            while j >= index-d && j >= 0 {
                if arr[j] >= arr[index] {
                    break
                }
                
                if dp[j] != 0 {
                    dp[index] = max(dp[index], dp[j]+1)
                }
                
                j -= 1
            }
            
            /* Find right part */
            j = index+1
            while j <= index+d && j < count {
                if arr[j] >= arr[index] {
                    break
                }
                
                if dp[j] != 0 {
                    dp[index] = max(dp[index], dp[j]+1)
                }
                
                j += 1
            }
            
            res = max(res, dp[index])
        }
        
        return res
    }
        
    func test() -> Void {
        print(maxJumps([6,4,14,6,8,13,9,7,10,6,12], 2))
        print(maxJumps([3,3,3,3,3], 3))
        print(maxJumps([7,6,5,4,3,2,1], 1))
    }
}
