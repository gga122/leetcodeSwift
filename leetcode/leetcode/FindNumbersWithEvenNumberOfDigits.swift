//
//  FindNumbersWithEvenNumberOfDigits.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindNumbersWithEvenNumberOfDigitsSolution {
    func findNumbers(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }

        var count = 0
        for num in nums {
            var tNum = num
            var numCnt = 0
            while tNum > 0 {
                tNum /= 10
                numCnt += 1
            }

            if numCnt % 2 == 0 {
                count += 1
            }
        }

        return count
    }

    func test() -> Void {
        print(findNumbers([12,345,2,6,7896]))
        print(findNumbers([555,901,482,1771]))
    }
}
