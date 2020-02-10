//
//  BestTimeToBuyAndSellStockWithCooldown.swift
//  leetcode
//
//  Created by MickyZhu on 6/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class BestTimeToBuyAndSellStockWithCooldownSolution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        
        var dp = [Int].init(repeating: 0, count: prices.count)
        for i in 2..<prices.count {
            dp[i] = max(dp[i-1], dp[i-2]+prices[i]-prices[i-2])
        }
        
        return dp.last!
    }
    
    func test() -> Void {
        print(maxProfit([1,2,3,0,2]))
    }
}
