//
//  FindAllNumbersDisappearedInAnArray.swift
//  leetcode
//
//  Created by Henry on 2019/5/8.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindAllNumbersDisappearedInAnArraySolution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var ret = [Int]()
        
        var set = Set<Int>.init()
        for n in nums {
            set.insert(n)
        }
        
        let upper = nums.count
        var i = 1
        while i <= upper {
            if !set.contains(i) {
                ret.append(i)
            }
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(findDisappearedNumbers([4, 3, 2, 7, 8, 2, 3, 1]))
    }
}
