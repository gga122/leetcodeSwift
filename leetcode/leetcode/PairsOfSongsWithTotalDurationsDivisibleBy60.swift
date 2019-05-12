//
//  PairsOfSongsWithTotalDurationsDivisibleBy60.swift
//  leetcode
//
//  Created by Henry on 2019/5/13.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PairsOfSongsWithTotalDurationsDivisibleBy60Solution {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        if time.count == 0 {
            return 0
        }
        
        var count = 0
        var hashs = [Int: Int]()
        for duration in time {
            /* Make all durations fall over in [0, 60] */
            let t = duration % 60
            /* Mod 60 again for handle 60 */
            let pairedDuration = (60 - t) % 60
            count += hashs[pairedDuration] ?? 0
            
            /* save count in hashs */
            if let c = hashs[t] {
                hashs[t] = c + 1
            } else {
                hashs[t] = 1
            }
        }
        
        return count
    }
    
    func test() -> Void {
        print(numPairsDivisibleBy60([30,20,150,100,40]))
        print(numPairsDivisibleBy60([60,60,60]))
    }
}
