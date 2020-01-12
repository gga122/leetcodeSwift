//
//  ConvertIntegerToTheSumOfTwoNo-ZeroIntegers.swift
//  leetcode
//
//  Created by Henry on 2020/1/13.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ConvertIntegerToTheSumOfTwoNo_ZeroIntegersSolution {
    func getNoZeroIntegers(_ n: Int) -> [Int] {
        var target = 0
        for i in 1...n/2 {
            if containZero(i) {
                continue
            }
            if containZero(n-i) {
                continue
            }
            target = i
            break
        }

        return [target, n-target]
    }

    func containZero(_ num: Int) -> Bool {
        if num == 0 {
            return true
        }
        var num = num
        while num > 0 {
            if num % 10 == 0 {
                return true
            }
            num = num / 10
        }

        return false
    }

    func test() -> Void {
        print(getNoZeroIntegers(2))
        print(getNoZeroIntegers(11))
        print(getNoZeroIntegers(10000))
    }
}
