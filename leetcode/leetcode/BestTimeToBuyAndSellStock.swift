//
//  BestTimeToBuyAndSellStock.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BestTimeToBuyAndSellStockSolution {
    func maxProfitOnce(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }
        
        var min = prices.first!
        var max = 0
        for i in 1...(prices.count - 1) {
            if prices[i] < min {
                min = prices[i]
            } else if prices[i] - min > max {
                max = prices[i] - min
            }
        }
        
        return max
    }
    
    func maxProfitMultiple(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }
        
        var profit = 0
        for i in 1...(prices.count - 1) {
            if prices[i] > prices[i - 1] {
                profit += prices[i] - prices[i - 1]
            }
        }
        
        return profit
    }
    
    func testOnce() -> Void {
        print(maxProfitOnce([7, 1, 5, 3, 6, 4]))
        print(maxProfitOnce([7, 6, 4, 3, 1]))
    }
    
    func testMultiple() -> Void {
        print(maxProfitMultiple([7, 1, 5, 3, 6, 4]))
        print(maxProfitMultiple([7, 6, 4, 3, 1]))
        print(maxProfitMultiple([1, 2, 3, 4, 5]))
    }
}
