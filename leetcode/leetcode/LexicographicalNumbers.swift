//
//  LexicographicalNumbers.swift
//  leetcode
//
//  Created by Henry on 2019/5/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LexicographicalNumbersSolution {
    func lexicalOrder(_ n: Int) -> [Int] {
        if n < 1 {
            return []
        }
        
        var ret = [Int]()
        for i in 1...9 {
            if i <= n {
                ret.append(i)
                helper(&ret, n, i * 10)
            } else {
                break
            }
        }
        
        return ret
    }
    
    func helper(_ result: inout [Int], _ n: Int, _ sum: Int) -> Void {
        for i in 0...9 {
            let tmp = sum + i
            if tmp <= n {
                result.append(tmp)
                helper(&result, n, tmp * 10)
            } else {
                break
            }
        }
    }
    
    func test() -> Void {
        print(lexicalOrder(13))
        print(lexicalOrder(99))
    }
}
