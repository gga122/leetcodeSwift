//
//  347.swift
//  LeetCode
//
//  Created by henry on 2024/11/11.
//

import Foundation

class Solution_347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        /**
         打表记录每种元素的个数, 时间复杂度O(n)
         */
        var map = [Int: Int]()
        for num in nums {
            if let c = map[num] {
                map[num] = c+1
            } else {
                map[num] = 1
            }
        }
        
        /**
         基于个数来排序, 时间复杂度O(nlogN)
         */
        var entries = map.map { ($0.key, $0.value) }
        entries.sort { $0.1 > $1.1 }
        
        return entries[0..<k].map { $0.0 }
    }
}
