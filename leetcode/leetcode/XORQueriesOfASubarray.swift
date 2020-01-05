//
//  XORQueriesOfASubarray.swift
//  leetcode
//
//  Created by mickyzhu on 2020/1/5.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class XORQueriesOfASubarraySolution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var map = [String: Int]()
        var result = [Int]()
        for query in queries {
            let begin = query[0]
            let end = query[1]

            var val = 0
            let key = "\(begin)\(end)"
            if map[key] == nil {
                for index in begin...end {
                    let ele = arr[index]
                    val = val ^ ele
                }
                map[key] = val
            } else {
                val = map[key]!
            }
            
            result.append(val)
        }
        
        return result
    }
    
    func test() -> Void {
        print(xorQueries([1,3,4,8], [[0,1],[1,2],[0,3],[3,3]]))
    }
}
 
