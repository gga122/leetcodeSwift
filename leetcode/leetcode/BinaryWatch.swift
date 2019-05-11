//
//  BinaryWatch.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BinaryWatchSolution {
    func readBinaryWatch(_ num: Int) -> [String] {
        if num >= 10 {
            return []
        }
        if num == 0 {
            return ["0:00"]
        }
        
        var ret = [String]()
        for h in 0...11 {
            for m in 0...59 {
                var hourBitCount = 0
                var hour = h
                while hour > 0 {
                    if hour % 2 != 0 {
                        hourBitCount += 1
                    }
                    hour /= 2
                }
                var min = m
                var minBitCount = 0
                while min > 0 {
                    if min % 2 != 0 {
                        minBitCount += 1
                    }
                    min /= 2
                }
                
                if hourBitCount + minBitCount == num {
                    let s = String.init(format: "%d:%02d", h, m)
                    ret.append(s)
                }
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(readBinaryWatch(1))
    }
}
