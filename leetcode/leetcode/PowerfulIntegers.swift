//
//  PowerfulIntegers.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class PowerfulIntegersSolution {
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        var set = Set<Int>.init()
        let maxLogX = x == 1 ? 0 : Int(floor(log(Double(bound - 1)) / log(Double(x))))
        let maxLogY = y == 1 ? 0 : Int(floor(log(Double(bound)) / log(Double(y))))
        for i in 0...maxLogX {
            for j in 0...maxLogY {
                let v = Int(pow(Double(x), Double(i))) + Int(pow(Double(y), Double(j)))
                if v <= bound {
                    set.insert(v)
                }
            }
        }
        
        var ret = [Int]()
        for v in set {
            ret.append(v)
        }
        
        return ret
    }
    
    func test() -> Void {
        print(powerfulIntegers(2, 3, 10))
        print(powerfulIntegers(3, 5, 15))
        print(powerfulIntegers(2, 1, 10))
    }
}
