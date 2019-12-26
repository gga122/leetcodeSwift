//
//  SummaryRanges.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SummaryRangesSolution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count == 0 {
            return []
        } else if nums.count == 1 {
            return ["\(nums.first!)"]
        }
        
        var result = [String]()
        var begin = nums[0]
        var current = nums[0]
        for i in 1..<nums.count {
            if nums[i] == current + 1 {
                current = nums[i]
            } else {
                if begin == current {
                    result.append("\(begin)")
                    begin = nums[i]
                    current = nums[i]
                } else {
                    result.append("\(begin)->\(current)")
                    begin = nums[i]
                    current = nums[i]
                }
            }
        }
        if begin == current {
            result.append("\(begin)")
        } else {
            result.append("\(begin)->\(current)")
        }
        
        return result
    }
    
    func test() -> Void {
        print(summaryRanges([0,1,2,4,5,7]))
        print(summaryRanges([0,2,3,4,6,8,9]))
    }
}
