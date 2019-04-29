//
//  NumberComplement.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NumberComplementSolution {
    func findComplement(_ num: Int) -> Int {
        var mask = 1
        var n = num
        while n > 1 {
            mask = mask << 1
            mask += 1
            n = n >> 1
        }
        
        return num ^ mask
    }
    
    func test() -> Void {
        print(findComplement(5))
        print(findComplement(1))
    }
}
