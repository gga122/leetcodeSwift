//
//  MinimumFlipsToMakeAORBEqualToC.swift
//  leetcode
//
//  Created by Henry on 2020/1/13.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MinimumFlipsToMakeAORBEqualToCSolutionSolution {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        let binaryA = getBinary(a)
        let binaryB = getBinary(b)
        let binaryC = getBinary(c)

        var count = 0
        for i in 0...64 {
            var bitA = 0
            if i < binaryA.count {
                bitA = binaryA[i]
            }
            var bitB = 0
            if i < binaryB.count {
                bitB = binaryB[i]
            }
            var bitC = 0
            if i < binaryC.count {
                bitC = binaryC[i]
            }

            if bitA | bitB == bitC {
                continue
            }
            let distance = bitA + bitB - bitC
            count += abs(distance)
        }

        return count
    }

    func getBinary(_ n: Int) -> [Int] {
        var n = n
        var res = [Int]()
        while n > 0 {
            let bit = n % 2
            n = n / 2
            res.append(bit)
        }

        return res
    }

    func test() -> Void {
        print(minFlips(2, 6, 5))
        print(minFlips(4, 2, 7))
        print(minFlips(1, 2, 3))
    }
}
