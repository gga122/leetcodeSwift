//
//  AndroidUnlockPatterns.swift
//  leetcode
//
//  Created by Henry on 2020/1/17.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class AndroidUnlockPatternsSolution {
    
    func numberOfPatterns(_ m: Int, _ n: Int) -> Int {
        var result = [[Int]]()
        var tmp = [Int]()
        var flags = [Bool].init(repeating: false, count: 10)
        for i in m...n {
            backTracking(&result, 1, i, &tmp, &flags)
        }
        
        return result.count
    }
    
    func backTracking(_ result: inout [[Int]], _ step: Int, _ total: Int, _ tmp: inout [Int], _ useFlags: inout [Bool]) -> Void {
        if step > total {
            if tmp.count > 0 {
                result.append(tmp)
            }
            return
        }
        
        for i in 1..<useFlags.count {
            if useFlags[i] {
                continue
            }
            if !isValid(useFlags, tmp.last, i) {
                continue
            }
            
            tmp.append(i)
            useFlags[i] = true
            backTracking(&result, step+1, total, &tmp, &useFlags)
            useFlags[i] = false
            tmp.removeLast()
        }
    }
    
    func isValid(_ useFlags: [Bool], _ previous: Int?, _ current: Int) -> Bool {
        if previous == nil {
            return !useFlags[current]
        }
        
        let pt1_x = (previous!-1) / 3
        let pt1_y = (previous!-1) % 3
        let pt2_x = (current-1) / 3
        let pt2_y = (current-1) % 3
        
        if pt1_x == pt2_x && pt1_y + pt2_y == 2 {
            return useFlags[(current+previous!)/2]
        } else if pt1_y == pt2_y && pt1_x + pt2_x == 2 {
            return useFlags[(current+previous!)/2]
        } else if pt1_x + pt2_y + pt1_y + pt2_x == 4 && (current+previous!) == 10 {
            return useFlags[(current+previous!)/2]
        }
        
        return true
    }
    
    func test() -> Void {
        print(numberOfPatterns(1, 1))
        print(numberOfPatterns(1, 2))
        print(numberOfPatterns(2, 2))
    }
}
