//
//  GroupAnagrams.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class GroupAnagramsSolution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        if strs.count <= 1 {
            return [[String]].init(repeating: strs, count: 1)
        }
        
        var result = [[Character: Int]: [String]]()
        for i in 0..<strs.count {
            let str = strs[i]
            let dic = toDic(str)
            if result[dic] == nil {
                result[dic] = [str]
            } else {
                var v = result[dic]
                v!.append(str)
                result[dic] = v
            }
        }
        
        return Array(result.values)
    }
    
    func toDic(_ str: String) -> [Character: Int] {
        var dic = [Character: Int]()
        
        for c in str {
            if let v = dic[c] {
                dic[c] = v+1
            } else {
                dic[c] = 1
            }
        }
        
        return dic
    }
    
    func test() -> Void {
        print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
    }
}
