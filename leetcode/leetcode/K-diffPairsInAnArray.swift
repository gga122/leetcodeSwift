//
//  K-diffPairsInAnArray.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class K_diffPairsInAnArraySolution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        if nums.count <= 1 || k < 0 {
            return 0
        }
        
        var map = [Int: Int]()
        for num in nums {
            if let cnt = map[num] {
                map[num] = cnt+1
            } else {
                map[num] = 1
            }
        }
        
        var count = 0
        let sorted = map.sorted { (entry1, entry2) -> Bool in
            return entry1.key < entry2.key
        }
        
        for entry in sorted {
            if k == 0 {
                if entry.value > 1 {
                    count += 1
                }
            } else {
                let right = entry.key + k
                if map[right] != nil {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func test() -> Void {
        print(findPairs([3, 1, 4, 1, 5], 2))
        print(findPairs([1, 2, 3, 4, 5], 1))
        print(findPairs([1, 3, 1, 5, 4], 0))
        print(findPairs([1, 2, 3, 4, 5], -1))
    }
}
