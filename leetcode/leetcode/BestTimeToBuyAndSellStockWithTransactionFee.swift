//
//  BestTimeToBuyAndSellStockWithTransactionFee.swift
//  leetcode
//
//  Created by Henry on 2019/5/31.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BestTimeToBuyAndSellStockWithTransactionFeeSolution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        if prices.count == 0 {
            return 0
        }
        
        /* dont own a share of stock */
        var unholdDp = [Int].init(repeating: Int.min, count: prices.count)
        /* the first day we dont own a share of stock, so profit is 0 */
        unholdDp[0] = 0
        
        /* own a share of stock */
        var holdDp = [Int].init(repeating: Int.min, count: prices.count)
        /* the first day we own a share of stock, so profit is negative of the price */
        holdDp[0] = -prices[0]
        
        for i in 1..<prices.count {
            holdDp[i] = max(holdDp[i-1], unholdDp[i-1] - prices[i])
            unholdDp[i] = max(unholdDp[i-1], holdDp[i] + prices[i] - fee)
        }
        
        return unholdDp.last!
    }
    
    func test() -> Void {
        print(maxProfit([1, 3, 2, 8, 4, 9], 2))
        print(maxProfit([1,3,7,5,10,3], 3))
    }
}
