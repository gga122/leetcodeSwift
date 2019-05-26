//
//  MaxConsecutiveOnesIII.swift
//  leetcode
//
//  Created by Henry on 2019/5/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MaxConsecutiveOnesIIISolution {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        if A.count == 0 {
            return 0
        }
        if A.count < K {
            return A.count
        }
        
        var maxLength = 0
        var remainZeroCount = K
        var i = 0
        var j = 0
        while i < A.count && j < A.count {
            let num = A[j]
            /* If right is 1, just expand right */
            if num == 1 {
                j += 1
            } else {
                /* if current is 0, expand right as possible */
                if remainZeroCount > 0 {
                    remainZeroCount -= 1
                    j += 1
                } else {
                        /* if zero count exhausted and left is 1, move left and narrow the slider window. */
                    if A[i] == 1 {
                        i += 1
                    } else {
                        /* if zero count exhausted and left is 0, move left and right (the whole slider window), `[0....X],0` -> `0,[....X,0]` */
                        i += 1
                        j += 1
                    }
                }
            }
            
            maxLength = max(maxLength, j - i)
        }
        
        return maxLength
    }
    
    func test() -> Void {
        print(longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2))
        print(longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))
        print(longestOnes([0,0,0,0], 0))
        print(longestOnes([0,0,0,0], 1))
        print(longestOnes([0,0,0,1], 4))
    }
}
