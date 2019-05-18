//
//  GrayCode.swift
//  leetcode
//
//  Created by Henry on 2019/5/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class GrayCodeSolution {
    func grayCode(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        
        var ret = [Int]()
        let max = 1 << n
        for i in 0..<max {
            ret.append(i ^ i >> 1)
        }
        
        return ret
    }
    
    func test() -> Void {
        print(grayCode(2))
        print(grayCode(11))
    }
}
