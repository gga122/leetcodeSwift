//
//  LargestNumber.swift
//  leetcode
//
//  Created by Henry on 2019/6/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LargestNumberSolution {
    func largestNumber(_ nums: [Int]) -> String {
        var numStrs = [String]()
        for num in nums {
            numStrs.append("\(num)")
        }
        
        numStrs.sort { (ele1: String, ele2: String) -> Bool in
            let v1 = ele1 + ele2
            let v2 = ele2 + ele1
            return Int(v1)! < Int(v2)!
        }
        
        if numStrs.last! == "0" {
            return "0"
        }
        
        var res = ""
        for s in numStrs.reversed() {
            res += s
        }
        
        return res
    }
    
    func test() -> Void {
        print(largestNumber([10,2]))
        print(largestNumber([3,30,34,5,9]))
    }
}
