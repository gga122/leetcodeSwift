//
//  3.swift
//  LeetCode
//
//  Created by henry on 2024/10/24.
//

import Foundation

class Solution_3 {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        /**
         对于给定字符串中存在 [m-k, m] 位不重复字符的子串, 如果 m+1 位与 [m-k, m] 中 m-k+p 处
         则 [m-k, m+1] 中最长的不重复子串必为 [m-k, m], 同时从 m-k+p 处重新开始计算最长子串
         */
        var subRanges = [(Int, Int)]()
        var chars = [Character: Int]()
        
        var start: Int = 0
        var length: Int = 0
        
        let characters = Array(s)
        for index in 0..<characters.count {
            let c = characters[index]
            if let existedIndex = chars[c] {
                subRanges.append((start, length))
                
                length -= existedIndex - start
                for idx in start...existedIndex {
                    chars.removeValue(forKey: characters[idx])
                }
                start = existedIndex + 1
                chars[c] = index
            } else {
                chars[c] = index
                length += 1
            }
        }
        // 避免漏掉最后一个
        subRanges.append((start, length))

        return subRanges.map { $0.1 }.max() ?? 0
    }
    
}
