//
//  RevealCardsInIncreasingOrder.swift
//  leetcode
//
//  Created by Henry on 2019/5/16.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RevealCardsInIncreasingOrderSolution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        if deck.count == 1 {
            return deck
        }
        
        var sortedDeck = deck.sorted()
        var ret = [Int]()
        ret.append(sortedDeck.removeLast())
        var i = deck.count - 2
        while i >= 0 {
            /* Get the last card */
            let last = ret.removeLast()
            /* Put the last card to the top  */
            ret.insert(last, at: 0)
            /* Put the largest card in sorted cards */
            ret.insert(sortedDeck[i], at: 0)
            i -= 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(deckRevealedIncreasing([17, 13, 11, 2, 3, 5, 7]))
    }
}
