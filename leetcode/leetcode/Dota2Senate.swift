//
//  Dota2Senate.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class Dota2SenateSolution {
    func predictPartyVictory(_ senate: String) -> String {
        var RQueue = [Int]()
        var DQueue = [Int]()
        let chars = Array(senate)
        for i in 0..<chars.count {
            let c = chars[i]
            if c == "R" {
                RQueue.append(i)
            } else {
                DQueue.append(i)
            }
        }
        
        while !RQueue.isEmpty && !DQueue.isEmpty {
            let r = RQueue.removeFirst()
            let d = DQueue.removeFirst()
            
            if r < d {
                RQueue.append(r + chars.count)
            } else {
                DQueue.append(d + chars.count)
            }
        }
        
        return RQueue.isEmpty ? "Dire" : "Radiant"
    }
    
    func test() -> Void {
        print(predictPartyVictory("RD"))
        print(predictPartyVictory("RDD"))
    }
}
