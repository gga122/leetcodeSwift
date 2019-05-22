//
//  CoinChange.swift
//  leetcode
//
//  Created by Henry on 2019/5/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class CoinChangeSolution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount < 0 || coins.count == 0 {
            return -1
        }
        if amount == 0 {
            return 0
        }
        
        var dp = [Int](repeating: 0, count: amount+1)
        let maxCountFull = amount+1
        for aimMoney in 1..<maxCountFull {
            dp[aimMoney] = amount + 1
            for cindex in 0..<coins.count {
                let diff = aimMoney - coins[cindex]
                if diff < 0 {
                    continue
                }
                let newUseNumber = dp[diff] + 1
                if newUseNumber < dp[aimMoney] {
                    dp[aimMoney] = newUseNumber
                }
            }
        }
        
        return dp[amount] > 0 && dp[amount] < amount + 1  ? dp[amount] : -1
    }
    
    func test() -> Void {
        print(coinChange([1,2,5], 11))
        print(coinChange([2], 3))
        print(coinChange([1], 0))
    }
}
