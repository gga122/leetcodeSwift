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
        var n = n
        var idx = 1
        while n > idx {
            n -= idx
            idx += 1
        }
        return idx - 1
    }
    
    func test() -> Void {
        print(arrangeCoins(5))
        print(arrangeCoins(8))
    }
}
