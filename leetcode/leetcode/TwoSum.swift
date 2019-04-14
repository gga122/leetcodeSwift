//
//  main.swift
//  leetcode
//
//  Created by Henry on 2019/4/14.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TwoSumSolution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        
        for (index, value) in nums.enumerated() {
            let remain = target - value
            if let idx = map[remain] {
                return [idx, index]
            }
            
            map.updateValue(index, forKey: value)
        }
        
        return [];
    }
    
    func test() -> Void {
        print(twoSum([2, 7, 11, 15], 9))
    }
}
