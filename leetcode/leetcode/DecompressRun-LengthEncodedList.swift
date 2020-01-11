//
//  DecompressRun-LengthEncodedList.swift
//  leetcode
//
//  Created by Henry on 2020/1/12.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class DecompressRun_LengthEncodedListSolution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        var i = 0
        while 2 * i + 1 < nums.count {
            let a = nums[2*i]
            let b = nums[2*i+1]
            
            for _ in 1...a {
                res.append(b)
            }
            
            i += 1
        }
        
        return res
    }
    
    func test() -> Void {
        print(decompressRLElist([1,2,3,4]))
    }
}
