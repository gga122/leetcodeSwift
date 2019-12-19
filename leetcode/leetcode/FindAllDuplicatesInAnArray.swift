//
//  FindAllDuplicatesInAnArray.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/20.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindAllDuplicatesInAnArraySolution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var tmp = [Int].init(repeating: 0, count: nums.count)
        
        for num in nums {
            tmp[num-1] += 1
        }
        
        var ret = [Int]()
        for i in 0..<tmp.count {
            if tmp[i] == 2 {
                ret.append(i+1)
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(findDuplicates([4,3,2,7,8,2,3,1]))
    }
}
