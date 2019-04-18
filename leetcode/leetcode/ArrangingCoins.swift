//
//  ArrangingCoins.swift
//  leetcode
//
//  Created by Henry on 2019/4/18.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ArrangingCoinsSolution {
    func arrangeCoins(_ n: Int) -> Int {
        let k = sqrt(Double(2 * n) + 0.25) - 0.5
        return Int(k)
    }
    
    func test() -> Void {
        print(arrangeCoins(3))
        print(arrangeCoins(5))
        print(arrangeCoins(8))
    }
}
