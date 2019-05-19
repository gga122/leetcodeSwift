//
//  SingleNumberII.swift
//  leetcode
//
//  Created by Henry on 2019/5/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SingleNumberIISolution {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0
        var b = 0
        nums.forEach { (x) in
            b = (b ^ x) & ~a;
            a = (a ^ x) & ~b;
        }
        return b;
    }
    
    func test() -> Void {
        print(singleNumber([2,2,3,2]))
        print(singleNumber([0,1,0,1,0,1,99]))
    }
}
