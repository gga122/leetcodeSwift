//
//  K-thSmallestInLexicographicalOrder.swift
//  leetcode
//
//  Created by Henry on 2019/5/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class K_thSmallestInLexicographicalOrderSolution {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        if k == 1 {
            return 1
        }
        if n < 10 {
            return k
        }
        
        var cur = 1
        /* First Level is not 10-Tree, only 1-9 */
        var k = k - 1
        while (k > 0) {
            var step = 0
            var first = cur
            var last = cur + 1
            while first <= n {
                step += min(n + 1, last) - first
                first *= 10
                last *= 10
            }
            if step <= k {
                cur += 1
                k -= step
            } else {
                cur *= 10
                k -= 1
            }
        }
        
        return cur
    }
    
    func test() -> Void {
        print(findKthNumber(13, 2))
    }
}
